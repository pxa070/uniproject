const path = require("path");

const authMiddlewarePath = path.resolve("./middleware/auth.js");
console.log("Full resolved middleware path:", authMiddlewarePath);

try {
    const authMiddleware = require(authMiddlewarePath);
    console.log("Import successful!");
} catch (error) {
    console.error("Error loading auth middleware:", error);
}