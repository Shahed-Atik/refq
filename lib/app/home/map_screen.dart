import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/app/home/store/map_store.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/shared_fade_button.dart';

class MapScreen extends StatelessWidget {
  final MapStore _store = MapStore();
  final void Function(LatLng) onTap;
  MapScreen({Key? key, required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Observer(builder: (context) {
              return GoogleMap(
                myLocationButtonEnabled: false,
                markers: _store.markers.toSet(),
                zoomControlsEnabled: false,
                onTap: (argument) {
                  _store.changeLocation(argument);
                },
                mapType: MapType.normal,
                initialCameraPosition: _store.kGooglePlex,
                onMapCreated: (GoogleMapController googleCon) async {
                  _store.mapController = googleCon;
                  String style = await DefaultAssetBundle.of(context)
                      .loadString(
                          Theme.of(context).brightness == Brightness.dark
                              ? Assets.mapStyleDarkStyle
                              : Assets.mapStyleLightStyle);
                  googleCon.setMapStyle(style);
                },
              );
            }),
            Observer(builder: (context) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: AppFadeButton(
                    buttonText: LocaleKeys.map_enter_location.tr(),
                    opacity: _store.isChoosedLocation ? 1 : 0,
                    onPressed: () {
                      onTap(_store.selectedLocation!);
                      Navigator.of(context).pop();
                    }),
              );
            }),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(13.sp),
                child: SharedCircularButton(
                  background: Theme.of(context).colorScheme.primary,
                  icon: Icons.location_on,
                  onPressed: () {
                    _store.getMyLocation();
                  },
                ),
              ),
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
