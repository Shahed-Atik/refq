
import { Document } from "mongoose";


export default interface IStatistcs extends Document {
  
  city: string;

  countryCode: string;
  
  name: string;

  injruies: number;


}
