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
const volunteer_1 = __importDefault(require("../../models/volunteer"));
const geocoder_1 = __importDefault(require("../../middlewares/geocoder"));
class VolunteersController {
    static insert(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                let fcm = req.body.fcm;
                let lat = req.body.lat;
                let lon = req.body.lon;
                let reverseGeocoder = yield geocoder_1.default.reverse({ lat: lat, lon: lon });
                let address = reverseGeocoder[0].formattedAddress;
                let city = reverseGeocoder[0].city;
                let countryCode = reverseGeocoder[0].countryCode;
                const newVolunteer = new volunteer_1.default({
                    fcm: fcm,
                    address: address,
                    city: city,
                    countryCode: countryCode,
                    location: { lat, lon },
                    isActive: true
                });
                const volunteer = yield volunteer_1.default.updateOne({ fcm: fcm }, { fcm: newVolunteer.fcm,
                    address: newVolunteer.address,
                    city: newVolunteer.city,
                    countryCode: newVolunteer.countryCode,
                    location: newVolunteer.location,
                    isActive: newVolunteer.isActive
                }, { upsert: true });
                if (volunteer.upsertedCount === 0) {
                    const volunteer = yield volunteer_1.default.findOne({ fcm: fcm });
                    const id = volunteer === null || volunteer === void 0 ? void 0 : volunteer.id;
                    res.status(201).json(id);
                    return;
                }
                const id = volunteer.upsertedId;
                res.status(201).json(id);
            }
            catch (e) {
                console.log(`api, ${e}`);
                res.status(500).json("faild");
            }
        });
    }
    static deactivate(req, res, next) {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                let fcm = req.body.fcm;
                yield volunteer_1.default.updateOne({ fcm: fcm }, { isActive: false });
                res.status(200).json("updated!");
            }
            catch (e) {
                console.log(`api, ${e}`);
                res.status(500).json({ error: e });
            }
        });
    }
}
exports.default = VolunteersController;
