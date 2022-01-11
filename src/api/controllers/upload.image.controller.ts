import { Request, Response, NextFunction } from "express";
import { v2 as cloudinary } from "cloudinary";
import streamifier from "streamifier";

const destinationFolder: string = "images";

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET,
});

export default class uploadController {

  static async uploadImg(req: Request, res: Response, next: NextFunction) {
    let streamUpload = (req: Request) => {
      return new Promise((resolve, reject) => {
        let stream = cloudinary.uploader.upload_stream(
          {
            folder: destinationFolder,
          },
          (error, result) => {
            if (result) {
              resolve(result);
            } else {
              reject(error);
            }
          }
        );
        
        if (req.file === undefined) {
          console.log(req.file)
          return
        }

        streamifier.createReadStream(req.file.buffer).pipe(stream);
      });
    };

    streamUpload(req)
      .then((result: any) => {
        console.log(result);
        if (result)
          res.status(200).json({
            imageUrl: result["secure_url"],
          });
      })
      .catch((err) => {
        res.status(500).json({ message: "Failed", error: err.message });
      });
  }
}

