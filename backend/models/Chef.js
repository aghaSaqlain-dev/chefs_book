import mongoose from 'mongoose';


const chefSchema = new mongoose.Schema({
    chef_id: {
        type: String,
        required: true,
        unique: true
    },
    name: {
        type: String,
        required: true
    },
    profile_picture_url: {
        type: String
    },
    contact_info: {
        phone: {
            type: String
        },
        email: {
            type: String
        }
    },
    specialties: {
        type: [String]
    },
    experience_years: {
        type: Number,
        required: true
    },
    current_role: {
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
    world_rank: {
        type: Number
    },
    restaurant: {
        name: {
            type: String
        },
        location: {
            type: String
        },
        website: {
            type: String
        }
    }
}, { collection: 'chefs' });



export default mongoose.model('Chef', chefSchema);