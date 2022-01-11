import express from "express";

import bodyParser from "body-parser"

import env from "dotenv";

import mongoose from "mongoose";

import basicMiddlewares from "./middlewares/basics";

import indexRoutes from './api/routes/index.routes'

const app = express();

env.config();

const port = process.env.PORT || 8000;

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.use(basicMiddlewares);

app.use(indexRoutes)
 
async function connector() {
  try {
    await mongoose.connect(`${process.env.REFQ_DB_URI}`);
    await console.log("connected");
  }
  catch (e) {
      console.error(
        `Unable to establish a collection handle in moviesDAO: ${e}`,
      )} 
    }

connector()
  .then( result => {
    app.listen(port);
  })
  .catch( err => console.log(err) );



 



