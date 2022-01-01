import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/shared/services/location_service.dart';

part 'map_store.g.dart';

class MapStore = MapStoreBase with _$MapStore;

abstract class MapStoreBase with Store {
  MapStoreBase();

  ///for map
  late GoogleMapController mapController;

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @observable
  LatLng? selectedLocation;

  ObservableList<Marker> markers = ObservableList.of({});

  @action
  changeLocation(LatLng value) async {
    selectedLocation = value;
    _addMarker(value);
    CameraPosition _cameraPosition = CameraPosition(
      target: selectedLocation!,
      zoom: 17.00,
    );
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  @action
  _addMarker(LatLng point) async {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId(point.toString()),
      position: point,
      infoWindow: const InfoWindow(
        title: 'موقع الحالة',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ));
  }

  @computed
  bool get isChoosedLocation => selectedLocation != null;

  Future<void> getMyLocation() async {
    Position _myLocation = await LocationService().getLocation();
    CameraPosition _cameraPosition = CameraPosition(
      target: LatLng(_myLocation.latitude, _myLocation.longitude),
      zoom: 17.00,
    );
    mapController
        .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
}
