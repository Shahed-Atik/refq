"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const post_controllers_1 = __importDefault(require("../controllers/post.controllers"));
const router = (0, express_1.Router)();
router.post("/", post_controllers_1.default.apiInsertPost);
router.put("/", post_controllers_1.default.apiInsertPostDetail);
router.post("/accept", post_controllers_1.default.apiAcceptPost);
router.post("/refuse", post_controllers_1.default.apiRefusetPost);
router.get("/vid/:vid", post_controllers_1.default.apiGetPostsByVolunteer);
router.get("/id/:id", post_controllers_1.default.apiGetPostsById);
exports.default = router;
