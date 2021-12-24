import 'package:flutter/material.dart';
import 'package:refq_mongo/app/home/home_page.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/background_hands.dart';
import 'package:refq_mongo/shared/widgets/shared_elevated_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWithHands(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalAppPadding.sp,
              vertical: horizontalAppPadding.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  Assets.logoAdaptiveLogo,
                  width: 110.r,
                  height: 110.r,
                ),
              ),
              SizedBox(
                height: 50.0.h,
              ),
              Text(
                'Welcome in Refq',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              Text(
                'Rescue non-domestic animals that are injured in the street',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0.h,
              ),
              Center(
                child: SharedElevatedButton(
                  text: LocaleKeys.landing_getStarted.tr(),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyHomePage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
