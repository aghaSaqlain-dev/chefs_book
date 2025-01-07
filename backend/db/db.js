import mongoose from 'mongoose';
import dotenv from 'dotenv';


dotenv.config();
const url = process.env.MONGODB_URI;

export const connectDB = async () => {
    try {
        await mongoose.connect(url);
        console.log('MongoDB connected');
    } catch (error) {
        console.error('MongoDB connection error:', error);
        process.exit(1);
    }
};


export default connectDB;