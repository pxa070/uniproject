module.exports = (sequelize, DataTypes) => {
    const PasswordResetToken = sequelize.define(
        "PasswordResetToken",
        {
            id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            userId: {
                type: DataTypes.INTEGER,
                allowNull: false,
                references: {
                    model: 'users', // name of the users table
                    key: 'id',
                },
                onDelete: 'CASCADE', // optional, to automatically delete tokens if the user is deleted
            },
            token: {
                type: DataTypes.STRING(255),
                allowNull: false,
            },
            expiry: {
                type: DataTypes.DATE,
                allowNull: false,
            },
        },
        {
            tableName: "password_reset_tokens",
            timestamps: false,
            // Optionally, if you want to enforce naming conventions or other sequelize-specific configurations
        },
    );

    return PasswordResetToken;
};
