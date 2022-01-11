import 'dart:async';
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/app/home/repository/home_repository.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/widgets/custom_dialog.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

import '../../../main.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeStoreBase() {
    _repository = HomeRepository(dio);
  }

  late HomeRepository _repository;

  ///for map
  Completer<GoogleMapController> mapController = Completer();
  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @observable
  LatLng? selectedLocation;

  @observable
  bool loading = false;

  final ImagePicker _picker = ImagePicker();

  @observable
  File? image;

  @action
  takePhoto() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  onSubmit(context) async {
    if (selectedLocation == null || image == null) {
      showErrorToast(errorMessage: "Enter all data please");
    } else {
      loading = true;
      try {
        final String? result = await _repository.sendCase(
            image: image!, location: selectedLocation!);
        if (result == "created") {
          showSuccessToast(message: "The injury sent successfully");
          selectedLocation = null;
          image = null;
        } else if (result == "No volunteers") {
          //  showSuccessToast(message: "callDialog");
          callDialog(context);
        } else {
          showErrorToast(errorMessage: "Please choose the location correctly");
        }
      } on AppException catch (e) {
        showErrorToast(errorMessage: e.message);
      }
      loading = false;
    }
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
