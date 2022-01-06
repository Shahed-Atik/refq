import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'injury_details_store.g.dart';

class InjuryDetailsStore = InjuryDetailsStoreBase with _$InjuryDetailsStore;

abstract class InjuryDetailsStoreBase with Store {
  InjuryDetailsStoreBase();

  ///for map
  Completer<GoogleMapController> mapController = Completer();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @observable
  LatLng? selectedLocation;

  @observable
  late String image;

  onInit({required String image, required LatLng location}) async {
    this.image = image;
    changeLocation(location);
  }

  ObservableList<Marker> markers = ObservableList.of({});

  @action
  changeLocation(LatLng value) async {
    selectedLocation = value;
    _addMarker(value);
    final GoogleMapController controller = await mapController.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: selectedLocation!,
      zoom: 17.00,
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
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
}
