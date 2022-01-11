"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const volunteer_routes_1 = __importDefault(require("./volunteer.routes"));
const upload_routes_1 = __importDefault(require("./upload.routes"));
const post_routes_1 = __importDefault(require("./post.routes"));
const app = (0, express_1.default)();
app.use('/upload', upload_routes_1.default);
app.use('/post', post_routes_1.default);
app.use('/volunteer', volunteer_routes_1.default);
app.use((req, res, next) => {
    res
        .status(404)
        .send("<h1> you must not get this routes, trying to see different </h1>");
});
exports.default = app;
