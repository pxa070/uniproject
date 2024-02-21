// Course routes (routes/courses.js)
const express = require('express');
const router = express.Router();
const db = require('/database');

router.get('/', async (req, res) => {
    try {
        const { rows } = await db.query('SELECT * FROM courses');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: 'Internal server error' });
    }
});

module.exports = router;
