const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../database'); // Import your database connection

const Topic = sequelize.define('Topic', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    topic_name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true // Enforce unique topic names
    }
    // No subjectId references as per this schema (adjust if different in other parts of your project)
});

module.exports = Topic;
