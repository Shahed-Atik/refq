"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const upload_image_controller_1 = __importDefault(require("../controllers/upload.image.controller"));
const multer_1 = __importDefault(require("multer"));
const fileUpload = (0, multer_1.default)();
const router = (0, express_1.Router)();
router.post('/image', fileUpload.single('image'), upload_image_controller_1.default.uploadImg);
exports.default = router;
