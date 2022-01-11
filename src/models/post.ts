
import { model, Schema } from "mongoose";

import LatLonSchema from "./schema/LatLon";

import injury from "./schema/injury";

import IPost from "../interfaces/post";

const postSchema = new Schema<IPost> (
    {
        fcm: { type: String },
    
        address: { type: String, required: true },
    
        city: { type: String, required: true },
    
        countryCode: { type: String, required: true },

        location: { type: LatLonSchema, required: true },

        date: { type: Date, default: new Date() },

        imges: [{ type: String, required: true }],

        description: { type: String,  required: true, default: "null" },

        volunteer: {type: Schema.Types.ObjectId, ref: 'Volunteer' },

        injuries: [{ type: injury, required: false }],

        name: { type: String, required: false },
      
      },
      {
        versionKey: false,
      }
);

export default model<IPost>("Post", postSchema);
