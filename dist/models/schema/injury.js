"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
exports.default = new mongoose_1.Schema({
    k: { type: String, required: true, default: "injury" },
    v: { type: String, required: true },
}, {
    _id: false,
});
