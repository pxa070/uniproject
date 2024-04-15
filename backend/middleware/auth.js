const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {
    const header = req.header('Authorization');
    if (!header) {
        return res.status(401).json({ message: 'Authentication required' });
    }
    const token = header.replace('Bearer ', '');

    //Enforcing and checking authorisation of users to perform certain actions
    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.userId = decoded.userId;
        req.userRole = decoded.role; // Assuming your JWT includes a 'role' claim
        next(); // Successful auth, proceed to other middleware
    } catch (error) {
        res.status(401).json({ message: 'Invalid or expired token' });
    }
};

// Function to enforce role requirements for specific routes
const requireRole = (role) => {
    return (req, res, next) => {
        if (req.userRole !== role) {
            return res.status(403).json({ message: `This action requires ${role} privileges` });
        }
        next();
    };
};

module.exports = { authMiddleware, requireRole };

