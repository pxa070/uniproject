module.exports = (sequelize, DataTypes) => {
    const Subject = sequelize.define(
        "Subject",
        {
            id: {
                type: DataTypes.INTEGER,
                autoIncrement: true,
                primaryKey: true,
            },
            subject_name: {
                type: DataTypes.TEXT,
                allowNull: false,
                unique: true,
            },
        },
        {
            tableName: "subjects",
            timestamps: false,
        },
    );

    return Subject;
};
