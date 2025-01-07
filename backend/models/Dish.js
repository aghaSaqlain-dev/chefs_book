import mongoose from 'mongoose';

const dishSchema = new mongoose.Schema({
    chef: {
        type: String,
        required: true
    },
    categories: {
        type: [String],
        required: true
    },
    title: {
        type: String,
        required: true
    },
    affordability: {
        type: String,
        required: true
    },
    complexity: {
        type: String,
        required: true
    },
    imageUrl: {
        type: String,
        required: true
    },
    duration: {
        type: Number,
        required: true
    },
    ingredients: {
        type: [String],
        required: true
    },
    steps: {
        type: [String],
        required: true
    },
    isGlutenFree: {
        type: Boolean,
        required: true
    },
    isVegan: {
        type: Boolean,
        required: true
    },
    isVegetarian: {
        type: Boolean,
        required: true
    },
    isLactoseFree: {
        type: Boolean,
        required: true
    },
    createdAt: {
        type: Date,
        default: Date.now
    }
}, { collection: 'dishes' });

export default mongoose.model('Dish', dishSchema);