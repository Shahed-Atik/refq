"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const statisticsSchema = new mongoose_1.Schema({
    city: { type: String },
    countryCode: { type: String, required: true },
    name: { type: String, required: true },
    injruies: { type: Number, required: true, default: 0 },
}, {
    versionKey: false,
});
exports.default = (0, mongoose_1.model)("Statistics", statisticsSchema);
