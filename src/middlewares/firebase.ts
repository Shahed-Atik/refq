
var admin = require("firebase-admin");

var serviceAccount = require("../../refq2021.json");

export var firebase = admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});
