import express from 'express';

const router = express.Router();

router.post('/signin', async (req, res) => {
    console.log(req.body);
    if (req.body.email === 'admin' && req.body.password === 'admin') {
        res.status(200).json({ message: 'Success' });
    } else {
        res.status(401).json({ message: 'Invalid email or password' });
    }
});

export default router;