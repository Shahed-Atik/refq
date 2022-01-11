import { model, Schema } from "mongoose";

import IStatistcs from "../interfaces/statistics";

const statisticsSchema = new Schema<IStatistcs> (
  
  {
    city: { type: String },

    countryCode: { type: String, required: true },

    name: { type: String,  required: true },

    injruies: { type: Number, required: true, default: 0 },
    
  },
  {
    versionKey: false,
  }
);

export default model<IStatistcs>("Statistics", statisticsSchema);
