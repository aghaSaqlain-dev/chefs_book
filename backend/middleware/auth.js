// filepath: /c:/Users/Lenovo/Desktop/chefs_book/backend/middleware/auth.js
import jwt from 'jsonwebtoken';

const JWT_SECRET = 'verySecretKey';

const auth = (req, res, next) => {
    const token = req.header('Authorization').replace('Bearer ', '');

    if (!token) {
        return res.status(401).json({ error: 'No token provided' });
    }

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        req.chefId = decoded.chefId;
        next();
    } catch (error) {
        res.status(401).json({ error: 'Invalid token' });
    }
};

export default auth;