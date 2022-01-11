"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = require("mongoose");
const tempSchema = new mongoose_1.Schema({
    fcm: { type: String, required: true },
    volunteer: { type: mongoose_1.Schema.Types.ObjectId, ref: 'Volunteer' },
    post: { type: mongoose_1.Schema.Types.ObjectId, ref: 'Post' },
}, {
    versionKey: false,
});
exports.default = (0, mongoose_1.model)("Temp", tempSchema);
