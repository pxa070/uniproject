

module.exports = (sequelize, DataTypes) => {
    const Submission = sequelize.define("Submission", {
        id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true,
    },
    questionId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
            model: "questions", // Assumes you have a model file Question.js
            key: "question_id",
        },
    },
    studentId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        // references (if you have an existing users table)
    },
    studentAnswer: {
        type: DataTypes.TEXT,
        allowNull: false,
    },
    createdAt: { // Useful but optional
        type: DataTypes.DATE,
        defaultValue: sequelize.literal("CURRENT_TIMESTAMP")
    }
});

    return Submission;
};
