import express from 'express';
import Dish from '../models/Dish.js'; // Ensure you have a Dish model defined
import authMiddleware from '../middleware/auth.js'; // Middleware to authenticate the token

const router = express.Router();

router.post('/add', authMiddleware, async (req, res) => {
    const {
        categories,
        title,
        affordability,
        complexity,
        imageUrl,
        duration,
        ingredients,
        steps,
        isGlutenFree,
        isVegan,
        isVegetarian,
        isLactoseFree
    } = req.body;
    console.log(req.chefId);
    console.log(req.body)
    try {
        // const newDish = new Dish({
        //     chef: req.chefId,
        //     categories,
        //     title,
        //     affordability,
        //     complexity,
        //     imageUrl,
        //     duration,
        //     ingredients,
        //     steps,
        //     isGlutenFree,
        //     isVegan,
        //     isVegetarian,
        //     isLactoseFree
        // });
        await Dish.collection.insertOne({
            chef: req.chefId,
            categories,
            title,
            affordability,
            complexity,
            imageUrl,
            duration,
            ingredients,
            steps,
            isGlutenFree,
            isVegan,
            isVegetarian,
            isLactoseFree
        });

        console.log('after dish instance creation')
        // await newDish.save();
        res.status(201).json({ message: 'Dish added successfully' });
    } catch (error) {
        res.status(500).json({ error: 'Failed to add dish' });
    }
});



router.get('/', async (req, res) => {
    // console.log(req.query);
    const { email } = req.query;
    console.log(email)
    try {
        const dishes = await Dish.find({ chef: email });
        console.log('dishes fetched successfully')
        res.status(200).json(dishes);
    } catch (error) {
        res.status(500).json({ error: 'Failed to fetch dishes' });
    }
});

export default router;