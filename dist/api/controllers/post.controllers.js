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
const post_1 = __importDefault(require("../../models/post"));
const volunteer_1 = __importDefault(require("../../models/volunteer"));
const temp_1 = __importDefault(require("../../models/temp"));
const geocoder_1 = __importDefault(require("../../middlewares/geocoder"));
const statistics_1 = __importDefault(require("../../models/statistics"));
const firebase_1 = require("../../middlewares/firebase");
class PostsController {
    static insert(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const fcm = req.body.fcm;
                const lat = req.body.lat;
                const lon = req.body.lon;
                const img = req.body.img;
                const reverseGeocoder = yield geocoder_1.default.reverse({ lat: lat, lon: lon });
                const address = reverseGeocoder[0].formattedAddress;
                const city = reverseGeocoder[0].city;
                const countryCode = reverseGeocoder[0].countryCode;
                const newPost = new post_1.default({
                    fcm: fcm,
                    address: address,
                    city: city,
                    countryCode: countryCode,
                    location: { lat, lon },
                    imges: img,
                });
                const post = yield newPost.save();
                const volunteers = yield volunteer_1.default.find({
                    address: address,
                    city: city,
                    countryCode: countryCode,
                    isActive: true,
                });
                if (volunteers.length === 0) {
                    res.status(201).json("No volunteers");
                    return;
                }
                var responsersArray = [];
                volunteers.forEach((v) => {
                    const postId = post._id;
                    const fcm = v.fcm;
                    const latV = v.location.lat;
                    const lonV = v.location.lon;
                    const volunteerId = v._id;
                    const distance = getDistanceFromLatLonInKm(latV, lonV, lat, lon);
                    responsersArray.push({
                        fcm: fcm,
                        distance: distance,
                        volunteer: volunteerId,
                        post: postId,
                    });
                });
                responsersArray = responsersArray.sort((a, b) => a.distance - b.distance);
                const responsers = responsersArray.map((responser) => ({
                    fcm: responser.fcm,
                    post: responser.post,
                    volunteer: responser.volunteer,
                }));
                const options = { ordered: true };
                const test = yield temp_1.default.insertMany(responsers, options);
                console.log(test);
                sendNotification(responsersArray[0].fcm);
                res.status(201).json("created");
            }
            catch (e) {
                console.log(`api, ${e}`);
                res.status(500).json("faild");
            }
        });
    }
    static getAll(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const vId = req.params.vid;
                const posts = yield post_1.default.find({ volunteer: vId })
                    .sort({ date: -1 })
                    .select({ fcm: 0, address: 0, city: 0, countryCode: 0, volunteer: 0 });
                res.status(200).json(posts);
            }
            catch (e) {
                console.log(`api, ${e}`);
                res.status(500).json({ error: e });
            }
        });
    }
    static getTemps(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const vId = req.params.vid;
                const temps = yield temp_1.default.find({ volunteer: vId })
                    .sort({ date: -1 })
                    .select({ post: 1, _id: 0 });
                res.status(200).json(temps);
            }
            catch (e) {
                console.log(`api, ${e}`);
                res.status(500).json({ error: e });
            }
        });
    }
    static getOne(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const id = req.params.id;
                const posts = yield post_1.default.findById(id)
                    .sort({ date: -1 })
                    .select({ fcm: 0, address: 0, city: 0, countryCode: 0, volunteer: 0 });
                if (!posts) {
                    res.status(404).json({ error: "Not found" });
                    return;
                }
                res.json({ posts });
            }
            catch (e) {
                console.log(`api, ${e}`);
                res.status(500).json({ error: e });
            }
        });
    }
    static insertDetail(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const id = req.body.id;
                const img = req.body.img;
                const description = req.body.description;
                const injuries = req.body.injuries;
                const name = req.body.name;
                const detailPost = new post_1.default({
                    _id: id,
                    imges: img,
                    description: description,
                    injuries: injuries,
                    name: name,
                });
                let docs = yield post_1.default.findByIdAndUpdate(detailPost._id, {
                    $push: { imges: detailPost.imges, injuries: detailPost.injuries },
                    $set: { name: detailPost.name, description: detailPost.description },
                });
                console.log(docs);
                yield statistics_1.default.updateOne({
                    name: name,
                    city: docs === null || docs === void 0 ? void 0 : docs.city,
                    countryCode: docs === null || docs === void 0 ? void 0 : docs.countryCode,
                }, {
                    $inc: { injruies: 1 },
                }, {
                    upsert: true,
                });
                res.status(200).json("updated");
            }
            catch (e) {
                console.log(`api end , ${e}`);
                res.status(500).json("faild");
            }
        });
    }
    static accept(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const postId = req.body.postId;
                const volunteerId = req.body.volunteerId;
                const updated = yield post_1.default.findByIdAndUpdate(postId, {
                    $set: { volunteer: volunteerId },
                });
                if (updated === null) {
                    res.status(500).json("faild");
                    return;
                }
                yield temp_1.default.deleteMany({ post: postId });
                res.status(200).json("updated");
            }
            catch (e) {
                console.log(`api end , ${e}`);
                res.status(500).json("faild");
            }
        });
    }
    static refuse(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                const postId = req.body.postId;
                const volunteerId = req.body.volunteerId;
                const deleted = yield temp_1.default.findOneAndDelete({ post: postId, volunteer: volunteerId });
                if (deleted === null) {
                    res.status(500).json("faild");
                    return;
                }
                const responser = yield temp_1.default.findOne({ post: postId });
                if (responser === null) {
                    res.status(200).json("updated");
                    return;
                }
                sendNotification(responser === null || responser === void 0 ? void 0 : responser.fcm);
                res.status(200).json("updated");
            }
            catch (e) {
                console.log(`api end , ${e}`);
                res.status(500).json("faild");
            }
        });
    }
}
exports.default = PostsController;
function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
}
function deg2rad(deg) {
    return deg * (Math.PI / 180);
}
function sendNotification(responser) {
    const options = {
        priority: "high",
        timeToLive: 60 * 60 * 24,
    };
    const message = {
        data: { id: "please" },
        notification: {
            title: "Help!",
            body: "please save a soule",
        },
    };
    firebase_1.firebase.messaging().sendToDevice(responser, message, options);
}
