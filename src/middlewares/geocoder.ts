
const NodeGeocoder = require('node-geocoder');

import env from "dotenv";

env.config();

const options = {
  provider: process.env.GEOCODER_PROVIDER,
  apiKey: process.env.GEOCODER_API_KEY, 
  formatter: null 
};

const geocoder = NodeGeocoder(options);

export default geocoder;