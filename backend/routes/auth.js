import express from 'express';
import jwt from 'jsonwebtoken';
import Chef from '../models/Chef.js';
import dotenv from 'dotenv';

const router = express.Router();

dotenv.config();
const JWT_SECRET = process.env.JWT_SECRET || 'verySecureKey';


router.post('/signup', async (req, res) => {
    const {
        name,
        email,
        phone,
        profilePictureUrl,
        specialties,
        experienceYears,
        currentRole,
        location,
        rating,
        worldRank,
        restaurantName,
        restaurantLocation,
        restaurantWebsite,
        password
    } = req.body;

    console.log('data received in backend');
    console.log(req.body);

    try {

        console.log('Checking if chef exists with email:', email);
        const existingChef = await Chef.findOne({ email });
        console.log('Existing chef:', existingChef);
        if (existingChef) {
            return res.status(400).json({ error: 'Chef already exists' });
        }

        console.log('before inserting to db');
        await Chef.collection.insertOne({
            name,
            profilePictureUrl,
            email,
            phone,
            specialties,
            experienceYears,
            currentRole,
            location,
            rating,
            worldRank,
            restaurantName,
            restaurantLocation,
            restaurantWebsite,
            password
        });
        console.log('after inserting to db');
        res.status(201).json({ message: 'Chef registered successfully' });
    } catch (error) {
        console.error('Error registering chef:', error);
        if (error.code === 11000) {
            // Duplicate key error
            res.status(400).json({ error: 'Duplicate key error: A chef with this email already exists.' });
        } else {
            res.status(500).json({ error: 'Failed to register chef' });
        }
    }
});

// Route to handle chef signin
router.post('/signin', async (req, res) => {
    const { email, password } = req.body;

    try {

        const chef = await Chef.findOne({ email });
        if (!chef) {
            return res.status(400).json({ error: 'Invalid email or password' });
        }

        if (chef.password !== password) {
            return res.status(400).json({ error: 'Invalid email or password' });
        }

        // Generate a JWT token
        const token = jwt.sign({ chefId: chef.email }, JWT_SECRET, { expiresIn: '1h' });

        res.status(200).json({ token });
    } catch (error) {
        res.status(500).json({ error: 'Failed to sign in' });
    }
});

export default router;