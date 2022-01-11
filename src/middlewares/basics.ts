import {json} from "body-parser"
import {Request, Response, NextFunction} from "express"

const middlewares = [
    (req : Request, res : Response, next : NextFunction) => {
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH');
        res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
        next();
    },
    json()
];

export default middlewares;