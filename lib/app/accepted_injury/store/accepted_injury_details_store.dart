import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:refq_mongo/app/accepted_injury/repository/accepted_injury_repository.dart';
import 'package:refq_mongo/app/injury_details/repository/injury_details_repository.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

part 'accepted_injury_details_store.g.dart';

class AcceptedInjuryDetailsStore = AcceptedInjuryDetailsStoreBase
    with _$AcceptedInjuryDetailsStore;

abstract class AcceptedInjuryDetailsStoreBase with Store {
  AcceptedInjuryDetailsStoreBase() {
    _repository = InjuryDetailsRepository(dio);
  }
  late InjuryDetailsRepository _repository;

  late final form;

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
  late String decs = "";

  late String postId;

  late ObservableList<Injury> injuries;

  ObservableList<Marker> markers = ObservableList.of({});

  ///this function has sent from last screen
  late Function _refreshFunction;

  onInit(
      {required AcceptedInjury data, required Function refreshFunction}) async {
    decs = data.description;
    injuries = ObservableList.of(data.injuries);
    changeLocation(LatLng(data.location.lat, data.location.lon));
    postId = data.id;
    form = FormGroup({
      'desc': FormControl<String>(validators: [
        Validators.required,
      ], value: decs != "null" ? data.description : null),
    });
    _refreshFunction = refreshFunction;
  }

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
  onInjuryChipsChanged(List<Injury> list) {
    injuries.clear();
    injuries.addAll(list);
  }

  @action
  onSendDetails(BuildContext context) async {
    if (!form.invalid) {
      if (injuries.isNotEmpty) {
        loading = true;
        try {
          String? response = await _repository.sendDetails(
              postId: postId,
              description: form.control("desc").value,
              list: injuries.toList());
          if (response != null && response == "updated") {
            showSuccessToast(message: "Details sent successfully");
            Navigator.of(context).pop();
            _refreshFunction();
            return;
          }
          showErrorToast(errorMessage: "Some thing Error");
        } on AppException catch (e) {
          showErrorToast(errorMessage: e.message);
        }
        loading = false;
      } else {
        showErrorToast(errorMessage: "Enter all data please");
      }
    } else {
      form.markAllAsTouched();
    }
  }
}
