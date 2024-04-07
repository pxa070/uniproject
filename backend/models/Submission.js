

module.exports = (sequelize, DataTypes) => {
    const Submission = sequelize.define("Submission", {
        // Model attributes are defined here
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },
        questionId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: "questions", // This should match the table name as defined in Sequelize model or the actual DB table name if using raw queries
                key: "question_id",
            },
        },
        studentId: {
            type: DataTypes.INTEGER,
            allowNull: false,
            references: {
                model: 'users', // This should match the table name
                key: 'id',
            },
        },
        studentAnswer: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        similarityIndex: {
            type: DataTypes.FLOAT,
            allowNull: true,
        },
        createdAt: {
            type: DataTypes.DATE,
            defaultValue: sequelize.literal("CURRENT_TIMESTAMP")
        },
    }, {
        // Other model options go here
        tableName: 'submissions', // Specify the table name here
    });

    return Submission;
};
