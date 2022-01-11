import { Router } from "express";

import uploadController from "../controllers/upload.image.controller";

import multer from "multer";

const fileUpload = multer();

const router = Router();


router.post('/image', fileUpload.single('image') , uploadController.uploadImg);


export default router;
