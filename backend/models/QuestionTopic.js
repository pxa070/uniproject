module.exports = (sequelize, DataTypes) => {
    const QuestionTopicLink = sequelize.define(
        "QuestionTopicLink",
        {
            question_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "questions",
                    key: "question_id",
                },
                primaryKey: true,
            },
            topic_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "topics",
                    key: "id",
                },
                primaryKey: true,
            },
        },
        {
            tableName: "question_topic_links",
            timestamps: false,
        },
    );

    return QuestionTopicLink;
};
