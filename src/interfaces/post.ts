
import { Document } from "mongoose";

import ILatLon from "./latLon";

import IInjury from "./injury";

import IVolunteer from "./volunteer";

export default interface IPost extends Document {
  
  fcm: string;

  address: string;

  city: string;

  countryCode: string;
  
  location: ILatLon;
  
  date: Date,

  imges: string[],

  description: string ,

  volunteer: IVolunteer,

  injuries: IInjury[],

  name: string 

}
