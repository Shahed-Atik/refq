import { Router } from "express";

import PostsController from '../controllers/post.controllers'

const router = Router();

router.post("/", PostsController.insert);

router.put("/", PostsController.insertDetail);

router.post("/accept", PostsController.accept);

router.post("/refuse", PostsController.refuse);

router.get("/vid/:vid", PostsController.getAll);

router.get("/id/:id", PostsController.getOne);

router.get("/temp/vid/:vid", PostsController.getTemps);

export default router;