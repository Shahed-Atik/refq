import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/app/home/store/map_store.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';
import 'package:refq_mongo/shared/widgets/shared_fade_button.dart';

class MapScreen extends StatefulWidget {
  final LatLng? selectedLocation;
  final void Function(LatLng) onTap;

  ///when we display InjuryDetails we set this flag ```false```
  final bool? enableChoosing;
  const MapScreen(
      {Key? key,
      required this.onTap,
      this.enableChoosing = true,
      this.selectedLocation})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapStore _store = MapStore();

  @override
  void initState() {
    if (widget.selectedLocation != null) {
      _store.addMarker(widget.selectedLocation!);
    }
    super.initState();
  }

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
                  if (widget.enableChoosing!) {
                    _store.changeLocation(argument);
                  }
                },
                mapType: MapType.normal,
                initialCameraPosition: widget.selectedLocation != null
                    ? CameraPosition(
                        target: widget.selectedLocation!,
                        zoom: 14.4746,
                      )
                    : _store.kGooglePlex,
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
                    opacity:
                        (_store.isChoosedLocation && widget.enableChoosing!)
                            ? 1
                            : 0,
                    onPressed: () {
                      widget.onTap(_store.selectedLocation!);
                      Navigator.of(context).pop();
                    }),
              );
            }),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(13.sp),
                child: SharedCircularButton(
                  iconColor: AppColors.white,
                  background: Theme.of(context).colorScheme.primary,
                  icon: Icons.location_on,
                  onPressed: () {
                    _store.getMyLocation();
                  },
                ),
              ),
            ),
            const AppBackButton()
          ],
        ),
      ),
    );
  }
}
