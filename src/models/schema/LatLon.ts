import { Schema } from "mongoose";

import ILatLon from "../../interfaces/latLon";

export default new Schema<ILatLon>(
  {
    lat: { type: Number, required: true },
    
    lon: { type: Number, required: true },
  },
  {
    _id: false,
  }
);
