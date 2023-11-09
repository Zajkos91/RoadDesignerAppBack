import express, {json} from "express";
import cors from "cors";
import "express-async-errors";
import {handleError} from "./utils/errors";
import rateLimit from "express-rate-limit";
import {roadRouter} from "./routers/road.router";
import {adminRouter} from "./routers/admin.router";

const app = express();

app.use(cors({
    origin: 'http://localhost:3000',
}));
app.use(json());
app.use(rateLimit({
    windowMs: 5 * 60 * 1000,
    max: 100,
}));

app.use('/road', roadRouter);
app.use('/login', adminRouter);
app.use(handleError);

app.listen(3001, '0.0.0.0', () => {
    console.log('Listening on port http://localhost:3001')
})