"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const cloudinary_1 = require("cloudinary");
const streamifier_1 = __importDefault(require("streamifier"));
const destinationFolder = "images";
cloudinary_1.v2.config({
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
    api_key: process.env.CLOUDINARY_API_KEY,
    api_secret: process.env.CLOUDINARY_API_SECRET,
});
class uploadController {
    static uploadImg(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            let streamUpload = (req) => {
                return new Promise((resolve, reject) => {
                    let stream = cloudinary_1.v2.uploader.upload_stream({
                        folder: destinationFolder,
                    }, (error, result) => {
                        if (result) {
                            resolve(result);
                        }
                        else {
                            reject(error);
                        }
                    });
                    if (req.file === undefined) {
                        console.log(req.file);
                        return;
                    }
                    streamifier_1.default.createReadStream(req.file.buffer).pipe(stream);
                });
            };
            streamUpload(req)
                .then((result) => {
                console.log(result);
                if (result)
                    res.status(200).json({
                        imageUrl: result["secure_url"],
                    });
            })
                .catch((err) => {
                res.status(500).json({ message: "Failed", error: err.message });
            });
        });
    }
}
exports.default = uploadController;
