
import { Document } from "mongoose";

import ILatLon from "./latLon";

export default interface IVolunteer extends Document {
  
  city: string;
  
  address: string;
  
  countryCode: string;
  
  fcm: string;
  
  location: ILatLon;
  
  isActive: boolean;

}
