import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class MapCard extends StatelessWidget {
  MapCard({Key? key}) : super(key: key);

  ///for map
  Completer<GoogleMapController> mapController = Completer();
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  LatLng? selectedLocation;
  Set<Marker> markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 150.0.h,
        decoration: BoxDecoration(
          borderRadius: borderRadiusCircular,
          border: Border.all(color: AppColors.primary),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1.0, 1.0),
                blurRadius: 7,
                spreadRadius: 1)
          ],
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: borderRadiusCircular,
            child: GoogleMap(
              onTap: (_) {
                // Get.to(MapScreen(
                //   sendCaseController: controller,
                // ));
              },
              markers: markers,
              mapToolbarEnabled: false,
              trafficEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              compassEnabled: false,
              mapType: MapType.normal,
              buildingsEnabled: false,
              indoorViewEnabled: false,
              liteModeEnabled: false,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController controller) async {
                mapController.complete(controller);
                String style = await DefaultAssetBundle.of(context).loadString(
                    Theme.of(context).brightness == Brightness.dark
                        ? Assets.mapStyleDarkStyle
                        : Assets.mapStyleLightStyle);
                //customize your map style at: https://mapstyle.withgoogle.com/
                controller.setMapStyle(style);
              },
            ),
          ),
        ),
      ),
    );
  }
}
