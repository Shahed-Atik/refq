import express from "express";

import volunteerRoutes from "./volunteer.routes"

import uploadRoutes from "./upload.routes"

import postRoutes from "./post.routes"

const app = express();

app.use('/upload', uploadRoutes);

app.use('/post', postRoutes);

app.use('/volunteer', volunteerRoutes)

app.use((req, res, next) => {
    res
      .status(404)
      .send("<h1> you must not get this routes, trying to see different </h1>");
  });

export default app;
