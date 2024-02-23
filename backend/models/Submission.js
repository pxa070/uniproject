const { DataTypes } = require('sequelize');
const {sequelize} = require('../database');
const Question = require('./Question'); // Import the Question model assuming a relationship

const Submission = sequelize.define('Submission', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    questionId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: Question, // Assumes you have a model file Question.js
            key: 'id'
        }
    },
    studentId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        // references (if you have an existing users table)
    },
    studentAnswer: {
        type: DataTypes.TEXT,
        allowNull: false
    },
    createdAt: { // Useful but optional
        type: DataTypes.DATE,
        defaultValue: sequelize.literal('CURRENT_TIMESTAMP')
    }
});

module.exports = Submission;
