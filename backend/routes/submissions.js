const express = require("express");
const router = express.Router();
const Submission = require("../models/Submission");
const authMiddleware = require("../middleware/auth");
const analyzeQuestion = require("/backend/utils/analyser");
const {answer_assistant, compare_correctness} = require("../utils/llm");
// GET: Fetch Submissions (With potential access controls)
router.get("/", authMiddleware, async (req, res) => {
    try {
        let submissions;

        // Access Control Logic  (Admin gets all, Students their own)
        if (req.user.isAdmin) {
            submissions = await Submission.findAll({ include: Question });
        } else {
            submissions = await Submission.findAll({
                where: { studentId: req.user.id },
                include: Question
            });
        }

        res.json(submissions);
    } catch (error) {
        // ... error handling, potentially different if admin vs typical user
    }
});

// GET: Single Submission
router.get("/:submissionId", authMiddleware, async (req, res) => {
    // ... Logic similar to the / route, considering ownership OR admin
    // Fetch Submission using findByPk(), potential ownership-based checks
});

// POST: Create a Submission (Linked to a Question)
router.post(
    "/questions/:questionId/submissions",
    authMiddleware,
    async (req, res) => {
    const { questionId } = req.params;
    const { studentAnswer, questionText } = req.body; // Assuming questionText in submission
    const studentId = req.user.id; // Assumes authentication

    try {
        const analysisResult = analyzeQuestion(questionText);

        const modelAnswer = await answer_assistant(questionText);
        const similarityIndex = await compare_correctness(questionText, modelAnswer, studentAnswer);


        const newSubmission = await Submission.create({
            questionId,
            studentId,
            studentAnswer,
            questionText,
            similarityIndex,
            keywords: analysisResult.keywords.join(","),
        });

        res.status(201).json(newSubmission);
    } catch (error) {
        console.error("Failed to save submission:", error);
        res.status(500).json({ message: "Submission failed" });
    }
});

// PUT: Update/Grade Submission (Likely admin/teacher role only)
router.put("/:submissionId", authMiddleware, async (req, res) => {
    const { submissionId } = req.params;
    const { score /* potentially other things */ } = req.body; // Data relevant to grading


    if (!req.user.isAdmin) {
        return res.status(403).json({ message: "Access forbidden" });
    }
    try {
        // ... Logic to find submissions by Id and update, including potential authorization checks for ensuring access
    } catch (error) {
        // ... Error handling...
    }
});

module.exports = router;
