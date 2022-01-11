"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const type_1 = __importDefault(require("./type"));
exports.default = new mongoose_1.Schema({
    name: { type: String, required: true },
    type: { type: type_1.default, required: true },
}, {
    _id: false,
});
