import Volunteer from "../../models/volunteer";

import geocoder from '../../middlewares/geocoder'

export default class VolunteersController {

    static async insert(req: any, res: any, next: any) {
        try {
          let fcm: string = req.body.fcm
          let lat: number = req.body.lat
          let lon: number = req.body.lon    
          let reverseGeocoder = await geocoder.reverse({ lat: lat, lon: lon })
          let address: string = reverseGeocoder[0].formattedAddress
          let city: string = reverseGeocoder[0].city
          let countryCode: string = reverseGeocoder[0].countryCode
          
          const newVolunteer = new Volunteer ({
            fcm: fcm,
            address: address,
            city: city,
            countryCode: countryCode,
            location: {lat, lon},
            isActive: true
          })

          const volunteer = await Volunteer.updateOne(
            { fcm : fcm },
            { fcm: newVolunteer.fcm, 
              address: newVolunteer.address,
              city: newVolunteer.city,
              countryCode: newVolunteer.countryCode,
              location: newVolunteer.location,
              isActive: newVolunteer.isActive
             },
            { upsert : true })

          if (volunteer.upsertedCount === 0 ) {
            const volunteer = await Volunteer.findOne({fcm: fcm })
            const id = volunteer?.id 
            res.status(201).json(id)
            return
          }         
          const id = volunteer.upsertedId 
          
          res.status(201).json(id)
          
        } catch (e) {
          console.log(`api, ${e}`)
          res.status(500).json("faild")
        }
      }


    static async deactivate(req: any, res: any, next: any) {
    try {

        let fcm = req.body.fcm

        await Volunteer.updateOne({ fcm: fcm }, { isActive: false })
        res.status(200).json("updated!")

    } catch (e) {
      console.log(`api, ${e}`);
      res.status(500).json({ error: e });
    }
  }
}

