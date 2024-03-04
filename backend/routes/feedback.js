// feedback.js
const express = require("express");
const router = express.Router();

const db = require("../models");

router.post("/question-feedback", async (req, res) => {
    const { questionId, feedback } = req.body;
    try {
        const newFeedback = await db.QuestionFeedback.create({
            question_id: questionId, // Make sure the field name matches the model definition
            feedback: feedback,
        });

        res.status(201).send("Feedback submitted successfully.");
    } catch (error) {
        console.error(error);
        res.status(500).send("Error submitting feedback.");
    }
});

module.exports = router;