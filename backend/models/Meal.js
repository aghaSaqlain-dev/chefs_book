import mongoose from 'mongoose';

const mealSchema = new mongoose.Schema({
    id: String,
    categories: [String],
    title: String,
    affordability: String,
    complexity: String,
    imageUrl: String,
    duration: Number,
    ingredients: [String],
    steps: [String],
    isGlutenFree: Boolean,
    isVegan: Boolean,
    isVegetarian: Boolean,
    isLactoseFree: Boolean,
}, { collection: 'meals' });

export default mongoose.model('Meal', mealSchema);