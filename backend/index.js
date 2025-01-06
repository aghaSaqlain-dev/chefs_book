import express from 'express';
import cors from 'cors';
import connectDB from './data/db.js';
import categoryRoutes from './routes/categories.js';
import mealRoutes from './routes/meals.js';
import chefRoutes from './routes/chefs.js';
import authRoutes from './routes/auth.js';

const app = express();
const port = 3000;

connectDB();
app.use(cors());
app.use(express.json());

app.use('/api/categories', categoryRoutes);
app.use('/api/meals', mealRoutes);
app.use('/api/chefs', chefRoutes);
app.use('/api/auth', authRoutes);

app.get('/', (req, res) => {
    res.send('Hello World!');
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});