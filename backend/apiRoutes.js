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

module.exports = router;