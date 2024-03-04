const { Sequelize } = require("sequelize");
const DB_URL = `postgres://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`;
const sequelize = new Sequelize(DB_URL);
const db = {};
db.Subject = require("./Subject")(sequelize, Sequelize.DataTypes);
db.User = require("./User")(sequelize, Sequelize.DataTypes);
db.Topic = require("./Topic")(sequelize, Sequelize.DataTypes);
db.Question = require("./Question")(sequelize, Sequelize.DataTypes);
db.Submission = require("./Submission")(sequelize, Sequelize.DataTypes);
db.QuestionFeedback = require("./QuestionFeedback")(
    sequelize,
    Sequelize.DataTypes,
);
db.Resource = require("./Resource")(sequelize, Sequelize.DataTypes);
db.QuestionTopicLink = require("./QuestionTopic")(
    sequelize,
    Sequelize.DataTypes,
);
sequelize
    .sync({ alter: true })
    .then(() => {
        console.log("tables has been successfully created/updated!");
    })
    .catch((error) => {
        console.error(
            "An error occurred while creating/updating the Questions table:",
            error,
        );
    });
db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;