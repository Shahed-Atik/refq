import { Schema } from "mongoose";

import IInjury from "../../interfaces/injury";

export default new Schema<IInjury>(
  {
    k: { type: String, required: true, default: "injury" },
    
    v: { type: String, required: true },
    
  },
  {
    _id: false,
  }
);
