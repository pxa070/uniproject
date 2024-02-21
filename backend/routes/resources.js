const express = require('express');
const router = express.Router();

// Handle resource creation
router.post('/', (req, res) => {
    // ...
});

// Retrieve resources associated with a question
router.get('/question/:questionId', (req, res) => {
    // ...
});

module.exports = router;
