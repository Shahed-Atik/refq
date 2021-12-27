import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/shared_fade_button.dart';

class MapScreen extends StatelessWidget {
  late GoogleMapController mapController;

  ///for map
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  LatLng? selectedLocation;
  Set<Marker> markers = Set<Marker>();

  MapScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              markers: markers,
              onTap: (argument) => {},
              mapType: MapType.normal,
              initialCameraPosition: kGooglePlex,
              onMapCreated: (GoogleMapController googleCon) async {
                mapController = googleCon;
                String style = await DefaultAssetBundle.of(context).loadString(
                    Theme.of(context).brightness == Brightness.dark
                        ? Assets.mapStyleDarkStyle
                        : Assets.mapStyleLightStyle);
                googleCon.setMapStyle(style);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppFadeButton(
                  buttonText: LocaleKeys.map_enter_location.tr(),
                  opacity: 1,
                  onPressed: () {}),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(horizontalAppPadding),
                child: SharedCircularButton(
                  icon: Icons.arrow_back_sharp,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
