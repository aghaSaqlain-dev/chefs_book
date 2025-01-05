import express from 'express';
import cors from 'cors';
import { connectDB } from './data/db.js';
import Category from './models/Category.js';
import Meal from './models/Meal.js';

const app = express();
const port = 3000;

connectDB();
app.use(cors());
app.use(express.json());

app.get('/categories', async (req, res) => {
    try {
        const categories = await Category.find();
        // console.log(categories)
        res.json(categories);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch categories' });
    }
});

app.get('/meals', async (req, res) => {
    try {
        const meals = await Meal.find();
        // console.log(meals)
        res.json(meals);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch meals' });
    }
});

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});