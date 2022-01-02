import 'package:flutter/material.dart';
import 'package:refq_mongo/app/home/store/home_store.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';
import 'package:refq_mongo/shared/widgets/map_card.dart';
import 'package:refq_mongo/shared/widgets/profile_image.dart';

class InjuryDetailsPage extends StatefulWidget {
  const InjuryDetailsPage({Key? key}) : super(key: key);
  @override
  State<InjuryDetailsPage> createState() => _InjuryDetailsPageState();
}

class _InjuryDetailsPageState extends State<InjuryDetailsPage> {
  final HomeStore _store = HomeStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                      return ProfileImage(
                        image: _store.image,
                        onTap: () => {_store.takePhoto()},
                      );
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
                    MapCard(
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
                          text: LocaleKeys.injury_details_accept_button.tr(),
                          onPressed: () => {},
                          color: AppColors.thirdColor,
                        ),
                        SharedOutlinedButton(
                            text: LocaleKeys.injury_details_reject_button.tr(),
                            onPressed: () => {}),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
