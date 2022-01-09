import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:refq_mongo/app/injury_details/store/injury_details_store.dart';
import 'package:refq_mongo/app/notification/repository/notification_repository.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';

import 'component/injury_image.dart';
import 'component/injury_location.dart';

class InjuryDetailsPage extends StatefulWidget {
  const InjuryDetailsPage(
      {Key? key, required this.data, required this.refreshFunction})
      : super(key: key);

  final InjuryWithData data;

  ///this function has sent from notification screen
  final Function refreshFunction;

  @override
  State<InjuryDetailsPage> createState() => _InjuryDetailsPageState();
}

class _InjuryDetailsPageState extends State<InjuryDetailsPage> {
  final InjuryDetailsStore _store = InjuryDetailsStore();

  @override
  void initState() {
    _store.onInit(
        refresh: widget.refreshFunction,
        image: widget.data.posts.imges[0],
        location: LatLng(
            widget.data.posts.location.lat, widget.data.posts.location.lon));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(horizontalAppPadding),
                        child: Text(
                          LocaleKeys.injury_details_injury_details.tr(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      const AppBackButton(),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(
                          left: horizontalAppPadding.sp,
                          right: horizontalAppPadding.sp),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          LocaleKeys.injury_details_injury_picture.tr(),
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Observer(builder: (context) {
                          return InjuryImage(image: _store.image, onTap: () {});
                        }),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          LocaleKeys.injury_details_injury_location.tr(),
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InjuryLocation(
                          store: _store,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SharedOutlinedButton(
                              text:
                                  LocaleKeys.injury_details_accept_button.tr(),
                              onPressed: () => {
                                _store.onAcceptInjury(
                                    postId: widget.data.posts.id,
                                    context: context)
                              },
                              color: AppColors.thirdColor,
                            ),
                            SharedOutlinedButton(
                              text:
                                  LocaleKeys.injury_details_reject_button.tr(),
                              onPressed: () => {
                                _store.onRefuseInjury(
                                    postId: widget.data.posts.id,
                                    context: context)
                              },
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (context) => (_store.loading)
                  ? Positioned.fill(
                      child: Container(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
