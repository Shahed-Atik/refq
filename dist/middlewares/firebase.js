"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.firebase = void 0;
var admin = require("firebase-admin");
var serviceAccount = require("../../refq2021.json");
exports.firebase = admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});
