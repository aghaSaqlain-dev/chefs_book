import express from "express";
import cors from "cors";
import { availableCategories, dummyMeals } from "./data.js";


const app = express();

const port = 3000;
app.use(cors());

app.get("/categories", (req, res) => {
    res.json(availableCategories);
});

app.get("/meals", (req, res) => {
    res.json(dummyMeals);
});

app.get("/", (req, res) => { res.send("Hello World!"); });

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});