"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
exports.default = new mongoose_1.Schema({
    lat: { type: Number, required: true },
    lon: { type: Number, required: true },
}, {
    _id: false,
});
