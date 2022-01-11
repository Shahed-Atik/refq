import { model, Schema } from "mongoose";

import LatLonSchema from "./schema/LatLon";

import IVolunteer from "../interfaces/volunteer";

const volunteerSchema = new Schema<IVolunteer>(
  {
    fcm: { type: String },

    address: { type: String, required: true },

    city: { type: String, required: true },

    countryCode: { type: String, required: true },

    isActive: { type: Boolean, default: false },

    location: { type: LatLonSchema, required: true },
  
  },
  {
    versionKey: false,
  }
);

export default model<IVolunteer>("Volunteer", volunteerSchema);
