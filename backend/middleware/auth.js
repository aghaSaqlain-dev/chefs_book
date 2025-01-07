import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';



dotenv.config();
const JWT_SECRET = process.env.JWT_SECRET || 'verySecureKey';


const authMiddleware = (req, res, next) => {
    const token = req.header('Authorization')?.replace('Bearer ', '');

    if (!token) {
        return res.status(401).json({ error: 'Access denied. No token provided.' });
    }
    console.log('before token verification')
    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        req.user = decoded;
        req.chefId = decoded.chefId;
        next();
    } catch (error) {
        res.status(400).json({ error: 'Invalid token.' });
    }
};

export default authMiddleware;