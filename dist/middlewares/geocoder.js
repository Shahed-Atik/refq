"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const NodeGeocoder = require('node-geocoder');
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
const options = {
    provider: process.env.GEOCODER_PROVIDER,
    apiKey: process.env.GEOCODER_API_KEY,
    formatter: null
};
const geocoder = NodeGeocoder(options);
exports.default = geocoder;
