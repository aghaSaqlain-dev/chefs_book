import mongoose from 'mongoose';

const categorySchema = new mongoose.Schema({
    id: String,
    title: String,
    color: String,
}, { collection: 'categories' });

export default mongoose.model('Category', categorySchema);