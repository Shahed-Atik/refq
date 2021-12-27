import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/app/home/map_screen.dart';
import 'package:refq_mongo/app/home/store/home_store.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class MapCard extends StatefulWidget {
  const MapCard({Key? key, required this.store}) : super(key: key);
  final HomeStore store;

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Sf");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MapScreen(),
        ));
      },
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
            child: IgnorePointer(
              ignoring: false,
              child: Observer(
                builder: (context) => GoogleMap(
                  onTap: (v) {
                    widget.store.changeLocation(v);
                  },
                  markers: widget.store.markers.toSet(),
                  mapToolbarEnabled: false,
                  trafficEnabled: false,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  compassEnabled: false,
                  mapType: MapType.normal,
                  buildingsEnabled: false,
                  indoorViewEnabled: false,
                  liteModeEnabled: false,
                  initialCameraPosition: widget.store.kGooglePlex,
                  onMapCreated: (GoogleMapController controller) async {
                    widget.store.mapController.complete(controller);
                    String style = await DefaultAssetBundle.of(context)
                        .loadString(
                            Theme.of(context).brightness == Brightness.dark
                                ? Assets.mapStyleDarkStyle
                                : Assets.mapStyleLightStyle);
                    controller.setMapStyle(style);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
