"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
exports.default = new mongoose_1.Schema({
    burning: { type: Number, required: true, default: 0 },
    broken: { type: Number, required: true, default: 0 },
    kitten: { type: Number, required: true, default: 0 },
    missingPet: { type: Number, required: true, default: 0 },
    trafficAccident: { type: Number, required: true, default: 0 },
}, {
    _id: false,
});
