"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const post_controllers_1 = __importDefault(require("../controllers/post.controllers"));
const router = (0, express_1.Router)();
router.post("/", post_controllers_1.default.insert);
router.put("/", post_controllers_1.default.insertDetail);
router.post("/accept", post_controllers_1.default.accept);
router.post("/refuse", post_controllers_1.default.refuse);
router.get("/vid/:vid", post_controllers_1.default.getAll);
router.get("/id/:id", post_controllers_1.default.getOne);
router.get("/temp/vid/:vid", post_controllers_1.default.getTemps);
exports.default = router;
