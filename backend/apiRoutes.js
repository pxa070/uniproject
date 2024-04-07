const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const {pool} = require("./database");
const router = express.Router();


function generateToken(userId) {
    return jwt.sign({ userId }, process.env.JWT_SECRET, { expiresIn: '1h' });
}
router.post('/api/signup', async (req, res) => {
    const { username, email, password } = req.body;
    // Validate email format
    // if (!validator.isEmail(email)) {
    //  return res.status(400).send({ message: 'Invalid email format' });
    // }
    // Hash password
    try {
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);
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
// User login endpoint
router.post('/api/login', async (req, res) => {
    const { username, password } = req.body;

    try {
        // Retrieve user from database
        const result = await pool.query('SELECT id, username, password, role FROM users WHERE username = $1', [username]);

        if (result.rows.length > 0) {
            const user = result.rows[0];
            // Compare hashed password
            const match = await bcrypt.compare(password, user.password);

            if (match) {
                // Generate JWT token with user ID and role
                const token = jwt.sign({ userId: user.id, role: user.role }, process.env.JWT_SECRET, { expiresIn: '1h' });
                // Include user's role in the response for the frontend to use
                res.json({ token: token, user: { userId: user.id, role: user.role } });
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


const requireAdmin = (req, res, next) => {
    try {
        const token = req.headers.authorization.split(' ')[1];
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        if (decoded.role === 'admin') {
            next();
        } else {
            res.status(403).send({ message: 'Admin access required' });
        }
    } catch (error) {
        res.status(401).send({ message: 'Invalid or expired token' });
    }
};

// Admin dashboard endpoint
router.get('/api/admin/dashboard', requireAdmin, async (req, res) => {
    // Your logic here, e.g., fetch and return dashboard data
    res.json({ message: 'Welcome to the Admin Dashboard' });
});

router.get('/api/admin/users', requireAdmin, async (req, res) => {
    try {
        const users = await pool.query('SELECT id, username, email FROM users'); // Select only necessary fields
        res.json(users.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error fetching users');
    }
});

router.get('/api/admin/questions', requireAdmin, async (req, res) => {
    try {
        const questions = await pool.query('SELECT id, question_text FROM questions'); // Adjust according to your table structure
        res.json(questions.rows);
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error fetching questions');
    }
});

router.delete('/api/admin/delete-user/:userId', requireAdmin, async (req, res) => {
    try {
        const { userId } = req.params;
        await pool.query('DELETE FROM users WHERE id = $1', [userId]);
        res.json({ message: 'User deleted successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error deleting user');
    }
});

router.delete('/api/admin/delete-question/:questionId', requireAdmin, async (req, res) => {
    try {
        const { questionId } = req.params;
        await pool.query('DELETE FROM questions WHERE id = $1', [questionId]);
        res.json({ message: 'Question deleted successfully' });
    } catch (error) {
        console.error(error);
        res.status(500).send('Server error deleting question');
    }
});







module.exports = router;