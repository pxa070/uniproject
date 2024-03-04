const jwt = require('jsonwebtoken');

const authMiddleware = (req, res, next) => {

    const header = req.header('Authorization');
    if (!header) {
        return res.status(401).json({ message: 'Authentication required' });
    }
    const token = header.replace('Bearer ', '');


    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.userId = decoded.userId;
        next(); // Successful auth,  proceed to other middleware
    } catch (error) {
        res.status(401).json({ message: 'Invalid or expired token' });
    }
};

module.exports = authMiddleware;


