import Post from "../../models/post";

import Volunteer from "../../models/volunteer";

import Temp from "../../models/temp";

import geocoder from "../../middlewares/geocoder";

import Statistics from "../../models/statistics";

import ITemp from "../../interfaces/temp";

import { firebase } from "../../middlewares/firebase";

import { ObjectId } from "mongoose";


export default class PostsController {
  static async insert(req: any, res: any, next: any) {
    try {
      const fcm: string = req.body.fcm;
      const lat: number = req.body.lat;
      const lon: number = req.body.lon;
      const img: string = req.body.img;
      const reverseGeocoder = await geocoder.reverse({ lat: lat, lon: lon });
      const address: string = reverseGeocoder[0].formattedAddress;
      const city: string = reverseGeocoder[0].city;
      const countryCode: string = reverseGeocoder[0].countryCode;

      const newPost = new Post({
        fcm: fcm,
        address: address,
        city: city,
        countryCode: countryCode,
        location: { lat, lon },
        imges: img,
      });

      const post = await newPost.save();

      const volunteers = await Volunteer.find({
        address: address,
        city: city,
        countryCode: countryCode,
        isActive: true,
      });
      
      if (volunteers.length === 0 ) {
        res.status(201).json( "No volunteers" );
        return ;}

      var responsersArray: any[] = [];
      
      volunteers.forEach((v) => {
        const postId: ObjectId = post._id;
        const fcm: string = v.fcm;
        const latV: number = v.location.lat;
        const lonV: number = v.location.lon;
        const volunteerId: ObjectId = v._id;
        const distance = getDistanceFromLatLonInKm(latV, lonV, lat, lon);

        responsersArray.push({
          fcm: fcm,
          distance: distance,
          volunteer: volunteerId,
          post: postId,
        });
      });
      
      responsersArray = responsersArray.sort((a, b) => a.distance - b.distance); 
      const responsers = responsersArray.map(
        (responser) =>
          <ITemp>{
            fcm: responser.fcm,
            post: responser.post,
            volunteer: responser.volunteer,
          }
      );
      const options = { ordered: true };
      
      const test = await Temp.insertMany(responsers, options );
      console.log(test)
      
      
      sendNotification(responsersArray[0].fcm);

      res.status(201).json("created");
    } catch (e) {
      console.log(`api, ${e}`);
      res.status(500).json("faild");
    }
  }
  static async getAll(req: any, res: any, next: any) {
    try {
      const vId = req.params.vid;

      const posts = await Post.find({ volunteer: vId })
        .sort({ date: -1 })
        .select({ fcm: 0, address: 0, city: 0, countryCode: 0, volunteer: 0 });

      res.status(200).json(posts)

    } catch (e) {
      console.log(`api, ${e}`);
      res.status(500).json({ error: e });
    }
  }
  static async getTemps(req: any, res: any, next: any) {
    try {
      const vId = req.params.vid;

      const temps = await Temp.find({ volunteer: vId })
        .sort({ date: -1 })
        .select({ post: 1, _id: 0 });

      res.status(200).json(temps)

    } catch (e) {
      console.log(`api, ${e}`);
      res.status(500).json({ error: e });
    }
  }
  static async getOne(req: any, res: any, next: any) {
    try {
      const id = req.params.id;
      const posts = await Post.findById(id)
        .sort({ date: -1 })
        .select({ fcm: 0, address: 0, city: 0, countryCode: 0, volunteer: 0 });
      if (!posts) {
        res.status(404).json({ error: "Not found" });
        return;
      }
      res.json({ posts });
    } catch (e) {
      console.log(`api, ${e}`);
      res.status(500).json({ error: e });
    }
  }
  static async insertDetail(req: any, res: any, next: any) {
    try {
      const id = req.body.id;
      const img: string = req.body.img;
      const description: string = req.body.description;
      const injuries = req.body.injuries;
      const name: string = req.body.name;

      const detailPost = new Post({
        _id: id,
        imges: img,
        description: description,
        injuries: injuries,
        name: name,
      });

      let docs = await Post.findByIdAndUpdate(detailPost._id, {
        $push: { imges: detailPost.imges, injuries: detailPost.injuries },
        $set: { name: detailPost.name, description: detailPost.description },
      });

      console.log(docs);

      await Statistics.updateOne(
        {
          name: name,
          city: docs?.city,
          countryCode: docs?.countryCode,
        },
        {
          $inc: { injruies: 1 },
        },
        {
          upsert: true,
        }
      );

      res.status(200).json("updated");
    } catch (e) {
      console.log(`api end , ${e}`);
      res.status(500).json("faild");
    }
  }
  static async accept(req: any, res: any, next: any) {
    try {
      const postId = req.body.postId;
      const volunteerId = req.body.volunteerId;

      const updated = await Post.findByIdAndUpdate(postId, {
        $set: { volunteer: volunteerId },
      });
      if (updated === null ) { res.status(500).json("faild"); return }
      
      await Temp.deleteMany({ post: postId });

      res.status(200).json("updated");
    } catch (e) {
      console.log(`api end , ${e}`);
      res.status(500).json("faild");
    }
  }
  static async refuse(req: any, res: any, next: any) {
    try {
      const postId = req.body.postId;
      const volunteerId = req.body.volunteerId;

      
      const deleted = await Temp.findOneAndDelete({ post: postId, volunteer: volunteerId });
      if (deleted === null ) { res.status(500).json("faild"); return }
   
      const responser = await Temp.findOne({post: postId})
      if (responser === null ) {  res.status(200).json("updated"); return }

      sendNotification(responser?.fcm)

      res.status(200).json("updated");
    } catch (e) {
      console.log(`api end , ${e}`);
      res.status(500).json("faild");
    }
  }
}

function getDistanceFromLatLonInKm(lat1: number, lon1: number, lat2: number, lon2: number) {
  var R = 6371; // Radius of the earth in km
  var dLat: number = deg2rad(lat2 - lat1); // deg2rad below
  var dLon: number = deg2rad(lon2 - lon1);
  var a =
    Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(deg2rad(lat1)) *
      Math.cos(deg2rad(lat2)) *
      Math.sin(dLon / 2) *
      Math.sin(dLon / 2);
  var c: number = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d: number = R * c; // Distance in km
  return d;
}

function deg2rad(deg: number) {
  return deg * (Math.PI / 180);
}

function sendNotification(responser: any) {
  const options = {
    priority: "high",
    timeToLive: 60 * 60 * 24,
  };

  const message = {
    data: { id: "please" },
    notification: {
      title: "Help!",
      body: "please save a soule",
    },
  };

  firebase.messaging().sendToDevice(responser, message, options);
}


