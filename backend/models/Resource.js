module.exports = (sequelize, DataTypes) => {
    const Resource = sequelize.define(
        "Resource",
        {
            resource_id: {
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
            resource_type: {
                type: DataTypes.STRING(50),
            },
            resource_link: {
                type: DataTypes.TEXT,
            },
            created_at: {
                type: DataTypes.DATE,
                defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
            },
            source_type: {
                type: DataTypes.STRING(50),
            },
        },
        {
            tableName: "resources",
            timestamps: false,
        },
    );

    return Resource;
};