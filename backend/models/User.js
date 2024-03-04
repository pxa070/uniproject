module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define(
        "User",
        {
            id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            username: {
                type: DataTypes.STRING(255),
                allowNull: false,
                unique: true,
            },
            password: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
            email: {
                type: DataTypes.STRING(255),
                allowNull: false,
                unique: true,
            },
            created_at: {
                type: DataTypes.DATE,
                defaultValue: sequelize.literal("CURRENT_TIMESTAMP"),
            },
            image_url: {
                type: DataTypes.STRING(255),
            },
        },
        {
            tableName: "users",
            timestamps: false,
        },
    );

    return User;
};