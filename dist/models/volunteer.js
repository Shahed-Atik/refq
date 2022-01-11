"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const LatLon_1 = __importDefault(require("./schema/LatLon"));
const volunteerSchema = new mongoose_1.Schema({
    fcm: { type: String },
    address: { type: String, required: true },
    city: { type: String, required: true },
    countryCode: { type: String, required: true },
    isActive: { type: Boolean, default: false },
    location: { type: LatLon_1.default, required: true },
}, {
    versionKey: false,
});
exports.default = (0, mongoose_1.model)("Volunteer", volunteerSchema);
