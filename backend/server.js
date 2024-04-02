require("dotenv").config(); // Loads environment variables from .env file
const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const validator = require("validator");
const cors = require("cors");
const analyzeQuestion = require("./utils/analyser");
const fetchResources = require("./utils/search");
const {authMiddleware, requireRole} = require("./middleware/auth");
const upload = require('./utils/uploadConfig');
const db = require("./models");
const { answer_assistant, compare_correctness } = require("./utils/llm");
const path = require("path");
const { Op } = require("sequelize");
const crypto = require('crypto');

const { PasswordResetToken } = require("./models/password_reset_tokens");
const { passwordResetEmailTemplate } = require('./utils/passwordResetEmailTemplate');
const {sendEmail} = require("./utils/email-util");


const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors()); // Enable CORS
app.use(express.json()); // Parse JSON bodies
app.use(express.static(path.resolve(__dirname, './', 'public')));

/*
 function authenticate(req, res, next) {
  try {
    const token = req.headers.authorization?.split(' ')[1]; // Updated and optional chaining
    if (!token) return res.status(401).send({ message: 'Missing authorization token' });

    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.userId = decoded.userId;
    next();
  } catch (error) {
    res.status(401).send({ message: 'Authentication failed' });
  }
} */

app.get("/api/questions", authMiddleware, async (req, res) => {
  try {
    const pageNumber = parseInt(req.query.page) || 0;
    let questions = await db.Question.findAll({
      where:{
        user_id: req.userId,
        model_answer_explanation: {
          [Op.not]: null,
          [Op.not]: ''
        },
      },
      limit: 100,
      offset: pageNumber * 10,
    });
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
          where: {
            question_id: parseInt(req.params.question_id),
          }
        });
        const similarity_index = await compare_correctness(
            question.question_text,
            question.model_answer_explanation,
            req.body.answer,
        );
        const regex = /[-+]?\d*\.?\d+([eE][-+]?\d+)?/g;
        const match = similarity_index.match(regex);
        if (!match) {
          return res.status(404).json({ message: "Please try again" });
        }

        return res.status(200).json({ similarity_index: match });
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

app.post("/api/forgot-password", async (req, res) => {
  try {
    const { email } = req.body;
    const user = await db.User.findOne({
      where: {
        email: email,
      }
    })
    if(!user){
      return res.status(400).send({ message: "User with this email does not exist" });
    }
    const token = crypto.randomBytes(20).toString('hex');
    const expiry = new Date(Date.now() + 900000); //Token expires 15 mins
    await db.PasswordResetToken.create({
      userId: user.id,
      token: token,
      expiry: expiry
    });


    const emailMsg = {
      subject: "Password reset",
      text: `Your password reset link is: http://localhost:3000/resetpassword/${token}`,
      html: passwordResetEmailTemplate(token)
    }
    try {
      await sendEmail(email, emailMsg);
      console.log({message: 'Your query has been sent'});
    } catch (e) {
      console.error(e);
    }

    return res.status(200).json({ message: "Valid Email" });
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Server error resetting password" });
  }
})

app.post("/api/reset-password", async (req, res) => {
  try {
    const { passwordToken, password } = req.body;
    const userToken = await db.PasswordResetToken.findOne({
      where: {
        token: passwordToken,
      }
    })
    if(!userToken){
      return res.status(400).send({ message: "Password token does not exist" });
    }
    const now = new Date();
    if (userToken.expiry < now) {
      await userToken.destroy();
      return res.status(400).send({ message: "Password token has expired" });
    }

      const user = await db.User.findOne({
        where: {
          id: userToken.userId,
        }
      })
    if(!user){
      return res.status(400).send({ message: "User does not exist" });
    }






    const hashedPassword = await bcrypt.hash(password, 10);
    await user.update({password: hashedPassword});
    await user.save();
    res.status(200).json({ message: "Password reset successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: "Server error resetting password" });
  }
})

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
        const token = jwt.sign({ userId: user.id, role: user.role}, process.env.JWT_SECRET, {
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

// In your routes (ensure this is protected or limited to a setup script)
// This route is an example; secure appropriately


// IMPORTANT: Secure this endpoint properly to prevent unauthorized admin creation.


// Route to delete a user by ID
// Deleting a user by ID with related questions due to foreign key constraint
// Deleting a user by ID with related questions due to foreign key constraint
app.delete('/api/admin/users/:userId', [authMiddleware, requireRole('admin')], async (req, res) => {
  const { userId } = req.params;
  try {
    // Delete related questions first
    await db.Question.destroy({
      where: { user_id: userId }
    });

    // Then delete the user
    const deletedUser = await db.User.destroy({
      where: { id: userId } // Correct column name
    });

    if (deletedUser) {
      return res.status(200).json({ message: 'User and related questions deleted successfully.' });
    } else {
      return res.status(404).json({ message: 'User not found.' });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Server error while deleting user.' });
  }
});

// Fetching all users for admin dashboard
app.get('/api/admin/users', [authMiddleware, requireRole('admin')], async (req, res) => {
  try {
    const users = await db.User.findAll({
      attributes: ['id', 'username', 'email', 'created_at', 'image_url']
        });
    res.json(users);
  } catch (error) {
    console.error('Error fetching users:', error);
    res.status(500).json({ message: "Failed to fetch users", error: error.message });
  }
});

// Fetching all questions for admin dashboard
app.get('/api/admin/questions', [authMiddleware, requireRole('admin')], async (req, res) => {
  try {
    const questions = await db.Question.findAll({
      attributes: ['question_id', 'question_text'] // Only select necessary fields
    });
    res.json(questions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error fetching questions" });
  }
});

// Deleting a question by ID
app.delete('/api/admin/questions/:questionId', [authMiddleware, requireRole('admin')], async (req, res) => {
  const { questionId } = req.params;
  try {
    const deletedQuestion = await db.Question.destroy({
      where: { question_id: questionId } // Correct column name
    });

    if (deletedQuestion) {
      return res.status(200).json({ message: 'Question deleted successfully.' });
    } else {
      return res.status(404).json({ message: 'Question not found.' });
    }
  } catch (error) {
    console.error(error);
    return res.status(500).json({ message: 'Server error while deleting question.' });
  }
});



app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});