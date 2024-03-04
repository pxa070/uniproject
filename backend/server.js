require("dotenv").config(); // Loads environment variables from .env file
const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const validator = require("validator");
const cors = require("cors");
const analyzeQuestion = require("./utils/analyser");
const fetchResources = require("./utils/search");
const authMiddleware = require("./middleware/auth");
const upload = require('./utils/uploadConfig');
const db = require("./models");
const { answer_assistant, compare_correctness } = require("./utils/llm");
const path = require("path");

const app = express();
const PORT = process.env.PORT || 3001;
// Middleware
app.use(cors()); // Enable CORS
app.use(express.json()); // Parse JSON bodies
console.log(path.resolve(__dirname, './', 'public'), ' path here')
app.use(express.static(path.resolve(__dirname, './', 'public')));

app.get("/api/questions", authMiddleware, async (req, res) => {
  try {
    const pageNumber = parseInt(req.query.page) || 0;
    let questions = await db.Question.findAll({
      limit: 10,
      offset: pageNumber * 10,
    });

    // You might want to return only certain fields as needed; adjust accordingly
    res.json(questions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error fetching questions" });
  }
});

app.get("/api/questions/:question_id", async (req, res) => {
  console.log(req.params ,"arams")
  try {
    let question = await db.Question.findOne({
      where :
          {question_id: req.params.question_id}
    });

    res.json(question);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error fetching questions" });
  }
});
app.post(
    "/api/question/:question_id/answer",
    authMiddleware,
    async (req, res) => {
      try {
        let question = await db.Question.findOne({
          question_id: req.params.question_id,
        });
        const similarity_index = await compare_correctness(
            question.question_text,
            question.model_answer_explanation,
            req.body.answer,
        );
        const regex = /(\d\.\d+)/;
        const match = similarity_index.match(regex);
        if (!match) {
          return res.status(404).json({ message: "Please try again" });
        }

        return res.status(200).json({ similarity_index: match[1] });
      } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error fetching questions" });
      }
    },
);
app.post("/api/questions", authMiddleware, async (req, res) => {
  try {
    const {
      questionText,
      resourceLinks,
      modelAnswer,
      subjectId,
      topicId,
      difficultyLevel /* other info */,
    } = req.body;
    const analysisResult = analyzeQuestion(questionText);
    const resources = await fetchResources(questionText);
    const model_answer_explanation = await answer_assistant(questionText);

    const newQuestion = await db.Question.create({
      question_text: questionText,
      resource_links: resourceLinks,
      user_id: req.userId,
      model_answer: modelAnswer,
      resources: resources,
      subject_id: subjectId,
      topic_id: topicId,
      difficulty_level: difficultyLevel,
      keywords: analysisResult.keywords,
      potentialTopic: analysisResult.topic,
      model_answer_explanation: model_answer_explanation,
    });

    res.status(201).json(newQuestion);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error creating question" });
  }
});
app.post("/api/questions/:questionId/submissions", async (req, res) => {
  try {
    const { questionId } = req.params;
    const { studentId, studentAnswer } = req.body; // Assuming you provide student identification
    const newSubmission = await db.Submission.create({
      question_id: questionId,
      student_id: studentId,
      student_answer: studentAnswer,
    });
    res.status(201).json(newSubmission);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error submitting answer" });
  }
});
app.get("/api/", (req, res) => {
  res.send("Hello World!");
});
// GET /api/users/:userId - Fetch user details
app.get("/api/users/:userId", authMiddleware, async (req, res) => {
  const { userId } = req.params;
  try {
    const user = await await db.User.findOne({
      where: {
        id: userId,
      },
    });
    if (user) {
      res.json(user);
    } else {
      res.status(404).send({ message: "User not found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Server error fetching user" });
  }
});

// Simplified JWT payload for the example
function generateToken(userId) {
  return jwt.sign({ userId }, process.env.JWT_SECRET, { expiresIn: "24h" });
}

app.post("/api/signup", async (req, res) => {
  const { username, email, password } = req.body;
  // Validate email format
  if (!validator.isEmail(email)) {
    return res.status(400).send({ message: "Invalid email format" });
  }
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await db.User.create({
      username: username,
      email: email,
      password: hashedPassword, // Assuming you've already hashed the password
    });
    const token = generateToken(newUser.id); // Generate JWT token after successful registration
    res.status(201).json({ token });
  } catch (error) {
    console.error(error);
    res.status(500).send("Server error during registration");
  }
});
// User login endpoint
app.get("/api/getMe", authMiddleware, async (req, res) => {
  try {
    const { userId } = req;
    const user = await db.User.findOne({
      where: {
        id: userId,
      },
    });
    if (!user) {
      res.status(400).send({ message: "User does not exists" });
    }
    res.status(200).send({user});
  } catch (err) {
    console.error(error);
    res.status(500).send({ message: "Server error during get ME" });
  }
});
app.post("/api/login", async (req, res) => {
  const { username, password } = req.body;
  try {
    const user = await db.User.findOne({
      where: {
        username: username,
      },
    });
    if (user) {
      // Compare hashed password
      const match = await bcrypt.compare(password, user.password);
      if (match) {
        // Generate JWT token
        const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET, {
          expiresIn: "24h",
        });
        res.json({ token: token, user });
      } else {
        res.status(400).send({ message: "Invalid credentials" });
      }
    } else {
      res.status(404).send({ message: "User not found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Server error during login" });
  }
});
// Authentication middleware (this is a simplified example, you should implement actual token verification)
app.post(
    "/api/questions/:questionId/feedback",
    authMiddleware,
    async (req, res) => {
      const { feedback } = req.body;
      const { questionId } = req.params;
      try {
        const newFeedback = await db.QuestionFeedback.create({
          questionId: questionId,
          feedback: feedback,
        });
        res.status(201).json(newFeedback);
      } catch (error) {
        console.error(error);
        res
            .status(500)
            .send({ message: "Server error when submitting feedback" });
      }
    },
);
app.put("/api/users", authMiddleware, upload, async (req, res) => {
  const { username, email } = req.body;
  if (!validator.isEmail(email)) {
    return res.status(400).send({ message: "Invalid email format" });
  } else if (!username) {
    return res.status(400).send({ message: "Username required" });
  }
  try {
    const toUpdate = {
      username: username,
      email: email,
    };
    if(req.file){
      toUpdate.image_url = req.file.path.split('public/')[1]
    }
    await db.User.update(
        toUpdate,
        {
          where: {
            id: req.userId,
          },
        },
    );
    const updatedUser = await db.User.findOne({
      where: {
        id: req.userId,
      },
      attributes: ["username", "email", "image_url"],
    });
    return res.status(200).json(updatedUser);
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Server error when updating settings" });
  }
});
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});