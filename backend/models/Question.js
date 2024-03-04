module.exports = (sequelize, DataTypes) => {
    const Question = sequelize.define(
        "Question",
        {
            question_id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            user_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "users",
                    key: "id",
                },
            },
            question_text: {
                type: DataTypes.TEXT,
                allowNull: false,
            },
            created_at: {
                type: DataTypes.DATE,
                defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
                allowNull: false,
            },
            tags: {
                type: DataTypes.ARRAY(DataTypes.STRING),
                allowNull: true,
            },
            model_answer_explanation: {
                type: DataTypes.TEXT,
                allowNull: true,
            },
            resources: {
                type: DataTypes.JSON,
                allowNull: true,
            },
            keywords: {
                type: DataTypes.ARRAY(DataTypes.STRING),
                allowNull: true,
                defaultValue: ["test", "test"],
            },
            potentialTopic: {
                type: DataTypes.TEXT,
                allowNull: true,
            },
        },
        {
            tableName: "questions",
        },
    );
    return Question;
};