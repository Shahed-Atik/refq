import 'package:geolocator/geolocator.dart';

class LocationService {
  //
  Future<Position> getLocation() async {
    //   Location location = new Location();
    //   bool _serviceEnabled;
    //   PermissionStatus _permissionGranted;
    //   LocationData _locationData;
    //
    //   _serviceEnabled = await location.serviceEnabled();
    //   if (!_serviceEnabled) {
    //     _serviceEnabled = await location.requestService();
    //     if (!_serviceEnabled) {
    //       throw Exception();
    //     }
    //   }
    //
    //   _permissionGranted = await location.hasPermission();
    //   if (_permissionGranted == PermissionStatus.denied) {
    //     _permissionGranted = await location.requestPermission();
    //     if (_permissionGranted != PermissionStatus.granted) {
    //       throw Exception();
    //     }
    //   }
    // get last known location, which is a future rather than a stream (best for android)
    // LocationResult result = await Geolocation.lastKnownLocation();
    var permission = await Geolocator.requestPermission();
    return await Geolocator.getCurrentPosition();
    // _locationData = await location.getLocation();
    //  return result;
  }
}
