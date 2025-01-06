import express from 'express';
import Meal from '../models/Meal.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const meals = await Meal.find();
        res.json(meals);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch meals' });
    }
});

export default router;