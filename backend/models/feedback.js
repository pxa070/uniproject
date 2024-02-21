// feedback.js
const express = require('express');
const router = express.Router();
const pool = require('../database'); // Assuming db.js exports your Pool instance

router.post('/question-feedback', async (req, res) => {
    const { questionId, feedback } = req.body;
    try {
        await pool.query('INSERT INTO question_feedback (question_id, feedback) VALUES ($1, $2)', [questionId, feedback]);
        res.status(201).send('Feedback submitted successfully.');
    } catch (error) {
        console.error(error);
        res.status(500).send('Error submitting feedback.');
    }
});

module.exports = router;
