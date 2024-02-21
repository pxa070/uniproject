const express = require('express');
const router = express.Router();
const Question = require('../models/Question');
const Submission = require('../models/Submission');
const { check, validationResult } = require('express-validator');
const authMiddleware = require("../middleware/auth");

// ... Inside POST '/submit' or similarly named route ...





// Include 'analysisResult.keywords' or  integrate results based on your design  during your database (PostgreSQL) save operation using Sequelize.


// ... other required models if dependencies exist outside of Questions routes

// Handle question submission (Existing: Keep as-is)


router.post('/', [
    check('questionText', 'Question Text is required').not().isEmpty(),
    // more validation rules here if needed
], async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({errors: errors.array()});
    }
});
router.post('/submit', async (req, res) => {
    // Extract Data
    const {
        keywords,
        questionText,
        resourceLinks,
        modelAnswer,
        subjectId,
        topicId,
        difficultyLevel, /* other fields */
    } = req.body;

    // Input Validation
    if (!questionText || !modelAnswer) {
        return res.status(400).json({message: 'Question text and model answer are required.'});
    }
    const analyzeQuestion = require('/backend/models/analyser');
    const analysisResult = analyzeQuestion(questionText);


    const fetchResources = require('../models/search');
    const resources = await fetchResources(analysisResult.keywords); // Adjusted variable name



    // Question Creation Logic
    try {
        const newQuestion = await Question.create({
            keywords: analysisResult.keywords.join(''),
            questionText,
            resourceLinks: JSON.stringify(resources),
            modelAnswer,
            subjectId,
            topicId: analysisResult.topic,
            difficultyLevel,
            /* other fields */
        });

        // Success Handling
        res.status(201).json(newQuestion);
    } catch (error) {
        console.error('Error creating question:', error);
        res.status(500).json({ message: 'Server error while creating question' });
    }
});

// Retrieve a specific question  (Existing: Keep as-is)
router.get('/:id', async (req, res) => {
    const { id } = req.params;

    try {
        const question = await Question.findByPk(id); // Find by primary key 'id'

        if (!question) {
            return res.status(404).json({ message: 'Question not found' });
        }

        res.json(question);
    } catch (error) {
        console.error('Error fetching question:', error);
        res.status(500).json({ message: 'Server error' });
    }
});


// Route for handling answers to a question  (Existing: Keep as-is)
router.post('/questions/:questionId/submissions', authMiddleware, async (req, res) => {
    const { questionId } = req.params;
    const { studentAnswer } = req.body;
    const studentId = req.userId; // Assumes the auth middleware fetches this

    try {
        const submission = await Submission.create({
            questionId,
            studentId,
            studentAnswer
        });
        res.status(201).json(submission);
    } catch (error) {
        console.error('Failed to save submission:', error);
        res.status(500).json({ message: 'Submission failed' });
    }
});

// Route for creating a new question
/* router.post('/', async (req, res) => {
    try {
        const { userId, questionText, tags, modelAnswerExplanation, keywords } = req.body;
        const newQuestion = await Question.create({
            userId, // Assuming proper ID coming from authentication
            question_text: questionText,
            tags,
            modelAnswerExplanation,
            keywords
        });
        res.status(201).json(newQuestion);
    } catch (error) {
        console.error('Error creating question:', error);
        res.status(500).json({ message: 'Server error' });
    }
});

 */






    module.exports = router;


