module.exports = (sequelize, DataTypes) => {
    const Topic = sequelize.define(
        "Topic",
        {
            id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            topic_name: {
                type: DataTypes.TEXT,
                allowNull: false,
            },
            subject_id: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: "subjects",
                    key: "id",
                },
            },
        },
        {
            tableName: "topics",
            timestamps: true,
        },
    );

    return Topic;
};