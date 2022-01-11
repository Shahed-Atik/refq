"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const LatLon_1 = __importDefault(require("./schema/LatLon"));
const injury_1 = __importDefault(require("./schema/injury"));
const postSchema = new mongoose_1.Schema({
    fcm: { type: String },
    address: { type: String, required: true },
    city: { type: String, required: true },
    countryCode: { type: String, required: true },
    location: { type: LatLon_1.default, required: true },
    date: { type: Date, default: new Date() },
    imges: [{ type: String, required: true }],
    description: { type: String, required: true, default: "null" },
    volunteer: { type: mongoose_1.Schema.Types.ObjectId, ref: 'Volunteer' },
    injuries: [{ type: injury_1.default, required: false }],
    name: { type: String, required: false },
}, {
    versionKey: false,
});
exports.default = (0, mongoose_1.model)("Post", postSchema);
