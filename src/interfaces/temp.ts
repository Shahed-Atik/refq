
import { Document } from "mongoose";
import IPost from "./post";
import IVolunteer from "./volunteer";


export default interface ITemp extends Document {

  fcm: string

  volunteer: IVolunteer

  post: IPost

}
