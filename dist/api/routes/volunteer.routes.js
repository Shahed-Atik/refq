"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const volunteer_controllers_1 = __importDefault(require("../controllers/volunteer.controllers"));
const router = (0, express_1.Router)();
router.post("/", volunteer_controllers_1.default.insert);
router.put("/", volunteer_controllers_1.default.deactivate);
exports.default = router;
