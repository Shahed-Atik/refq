import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/app/injury_details/repository/injury_details_repository.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

part 'injury_details_store.g.dart';

class InjuryDetailsStore = InjuryDetailsStoreBase with _$InjuryDetailsStore;

abstract class InjuryDetailsStoreBase with Store {
  InjuryDetailsStoreBase() {
    _repository = InjuryDetailsRepository(dio);
  }
  late InjuryDetailsRepository _repository;

  ///this function has sent from notification screen
  late Function _refreshFunction;

  ///for map
  Completer<GoogleMapController> mapController = Completer();

  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @observable
  bool loading = false;

  @observable
  LatLng? selectedLocation;

  @observable
  late String image = "";

  onInit(
      {required String image,
      required LatLng location,
      required Function refresh}) async {
    this.image = image;
    changeLocation(location);
    _refreshFunction = refresh;
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

  @action
  onAcceptInjury(
      {required String postId, required BuildContext context}) async {
    loading = true;
    try {
      String? response = await _repository.acceptInjury(postId: postId);
      if (response != null && response == "updated") {
        showSuccessToast(message: "Reply sent successfully");
        Navigator.of(context).pop();
        _refreshFunction();
        return;
      }
      showErrorToast(errorMessage: "Some thing Error");
    } on AppException catch (e) {
      showErrorToast(errorMessage: e.message);
    }
    loading = false;
  }

  @action
  onRefuseInjury(
      {required String postId, required BuildContext context}) async {
    loading = true;
    try {
      String? response = await _repository.refuseInjury(postId: postId);
      if (response != null && response == "updated") {
        showSuccessToast(message: "Reply sent successfully");
        Navigator.of(context).pop();
        _refreshFunction();
        return;
      }
      showErrorToast(errorMessage: "Some thing Error");
    } on AppException catch (e) {
      showErrorToast(errorMessage: e.message);
    }
    loading = false;
  }
}
