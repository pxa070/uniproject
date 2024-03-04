module.exports = (sequelize, DataTypes) => {
    const QuestionFeedback = sequelize.define(
        "QuestionFeedback",
        {
            feedback_id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            question_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "questions",
                    key: "question_id",
                },
            },
            feedback: {
                type: DataTypes.TEXT,
                allowNull: false,
            },
            created_at: {
                type: DataTypes.DATE,
                defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
            },
        },
        {
            tableName: "question_feedback",
            timestamps: false,
        },
    );
    return QuestionFeedback;
};