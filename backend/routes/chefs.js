import express from 'express';
import Chef from '../models/Chef.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const chefs = await Chef.find();
        res.json(chefs);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch chefs' });
    }
});

export default router;