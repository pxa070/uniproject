const { Pool } = require('pg'); // PostgreSQL client
const sequelize = require('./database');// If you're using Sequelize
require('dotenv').config(); // Loads environment variables from .env file
const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const validator = require('validator');
const cors = require('cors');
const analyzeQuestion = require('./models/analyser');
const fetchResources = require('./models/search');
const authMiddleware = require('./middleware/auth')




const app = express();
const PORT = process.env.PORT || 3001;

// Middleware
app.use(cors()); // Enable CORS
app.use(express.json()); // Parse JSON bodies


// Database connection pool
const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

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
// User registration endpoint

// Import your Question model here
const Question = require('./models/Question'); // Adjust your model's path

app.get('/api/questions', async (req, res) => {
  try {
    // Implement search (by filtering by query parameters) and result logic as needed
    let questions = await Question.findAll();

    // You might want to return only certain fields as needed; adjust accordingly
    res.json(questions);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error fetching questions' });
  }
});

app.post('/api/questions', async (req, res) => {
  try {
    const { questionText, resourceLinks, modelAnswer, subjectId, topicId, difficultyLevel /* other info */ } = req.body;
    const analysisResult = analyzeQuestion(questionText);
    const resources = await fetchResources(analysisResult.keywords);
    const newQuestion = await Question.create({
      question_text: questionText,
      resource_links: resourceLinks,
      model_answer: modelAnswer,
      subject_id: subjectId,
      topic_id: topicId,
      difficulty_level: difficultyLevel,
      keywords: analysisResult.keywords,
      potentialTopic: analysisResult.topic
    });

    res.status(201).json(newQuestion);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error creating question' });
  }
});



// Import Submission model (create this if not already defined)
const Submission = require('./models/Submission');

app.post('/api/questions/:questionId/submissions', async (req, res) => {
  try {
    const { questionId } = req.params;
    const { studentId, studentAnswer } = req.body; // Assuming you provide student identification

    const newSubmission = await Submission.create({
      question_id: questionId,
      student_id: studentId,
      student_answer: studentAnswer
    });

    res.status(201).json(newSubmission);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error submitting answer' });
  }
});




app.get('/api/', (req, res) => {
  res.send('Hello World!');
});

// GET /api/users/:userId - Fetch user details
app.get('/api/users/:userId', authMiddleware, async (req, res) => {
  const { userId } = req.params;

  try {
    const result = await pool.query('SELECT user_id, username, email FROM users WHERE user_id = $1', [userId]);

    if (result.rows.length > 0) {
      res.json(result.rows[0]);
    } else {
      res.status(404).send({ message: 'User not found' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: 'Server error fetching user' });
  }
});

// Simplified JWT payload for the example
function generateToken(userId) {
  return jwt.sign({ userId }, process.env.JWT_SECRET, { expiresIn: '1h' });
}


app.post('/api/signup', async (req, res) => {
  const { username, email, password } = req.body;

  // Validate email format
  // if (!validator.isEmail(email)) {
   //  return res.status(400).send({ message: 'Invalid email format' });
     // }

  // Hash password
  try {
    const hashedPassword = await bcrypt.hash(password, 10);
    const result = await pool.query('INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING id', [username, email, hashedPassword]);
    const token = generateToken(result.rows[0].id); // Generate JWT token after successful registration
    res.status(201).json({ token });
  } catch (error) {
    console.error(error);
    res.status(500).send('Server error during registration');
  }
});

// Include your routes for questions, submissions, and user details here

// Authentication middleware now uses simplified JWT token handling
app.use(authMiddleware);

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});




// User login endpoint
app.post('/api/login', async (req, res) => {
  const { username, password } = req.body;

  try {
    // Retrieve user from database
    const result = await pool.query('SELECT * FROM users WHERE username = $1', [username]);

    if (result.rows.length > 0) {
      const user = result.rows[0];
      // Compare hashed password
      const match = await bcrypt.compare(password, user.password);

      if (match) {
        // Generate JWT token
        const token = jwt.sign({ userId: user.user_id }, process.env.JWT_SECRET, { expiresIn: '1h' });
        res.json({ token: token, userId: user.user_id });
      } else {
        res.status(400).send({ message: 'Invalid credentials' });
      }
    } else {
      res.status(404).send({ message: 'User not found' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: 'Server error during login' });
  }
});

// Authentication middleware (this is a simplified example, you should implement actual token verification)


app.post('/api/questions/:questionId/feedback', authMiddleware, async (req, res) => {
  const { feedback } = req.body;
  const { questionId } = req.params;

  try {
    const result = await pool.query(
        'INSERT INTO question_feedback (question_id, feedback) VALUES ($1, $2) RETURNING *',
        [questionId, feedback]
    );
    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: 'Server error when submitting feedback' });
  }
});


app.put('/api/users/:userId/profile', authMiddleware, async (req, res) => {
  const { userId } = req.params;
  const { username, email } = req.body;

  // Validate input
  if (!validator.isEmail(email)) {
    return res.status(400).send({ message: 'Invalid email format' });
  }

  try {
    // Update user settings in the database
    const result = await pool.query(
        'UPDATE users SET username = $1, email = $2 WHERE user_id = $3 RETURNING username, email',
        [username, email, userId]
    );

    if (result.rows.length > 0) {
      // Return updated user settings
      res.json(result.rows[0]);
    } else {
      // No rows updated, user not found
      res.status(404).send({ message: 'User not found' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).send({ message: 'Server error when updating settings' });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});