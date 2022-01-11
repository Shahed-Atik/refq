import { model, Schema } from "mongoose";

import ITemp from "../interfaces/temp";

const tempSchema = new Schema<ITemp> (
  
  {
    fcm: { type: String , required: true },

    volunteer : {type: Schema.Types.ObjectId, ref: 'Volunteer' },

    post: {type: Schema.Types.ObjectId, ref: 'Post' },
    
  },
  {
    versionKey: false,
  }
);

export default model<ITemp>("Temp", tempSchema);
