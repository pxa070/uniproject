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
              // Add a new role attribute
            role: {
                type: DataTypes.STRING(255),
                allowNull: false,
                defaultValue: 'user', // Default value is 'user'
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