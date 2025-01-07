import mongoose from 'mongoose';

const chefSchema = new mongoose.Schema({
    chef_id: {
        type: String,
        unique: true, // To match the unique index in the database
        default: () => new mongoose.Types.ObjectId().toString() // Generate unique `chef_id` if not provided
    },
    name: {
        type: String,
        required: true
    },
    profilePictureUrl: {
        type: String
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    phone: {
        type: String
    },
    specialties: {
        type: [String]
    },
    experienceYears: {
        type: Number,
        required: true
    },
    currentRole: {
        type: String
    },
    location: {
        type: String
    },
    rating: {
        type: Number,
        min: 0,
        max: 5
    },
    worldRank: {
        type: Number
    },
    restaurantName: {
        type: String
    },
    restaurantLocation: {
        type: String
    },
    restaurantWebsite: {
        type: String
    },
    password: {
        type: String,
        required: true
    }
}, { collection: 'chefs' });

export default mongoose.model('Chef', chefSchema);
