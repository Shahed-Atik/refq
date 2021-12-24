import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/shared_elevated_button.dart';

import 'component/profile_image.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalAppPadding.sp,
              vertical: horizontalAppPadding.sp),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Report',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Container(
                      padding: EdgeInsets.all(13.sp),
                      child: const Icon(Icons.notifications),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 7,
                                spreadRadius: 1)
                          ]),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const ProfileImage(
                        image: null,
                      ),
                      SizedBox(
                        height: 300.h,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70.w,
                              height: 70.w,
                              child: SvgPicture.asset(
                                Assets.svgPetsNeedHelp,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 20.sp,
                            ),
                            Expanded(
                              flex: 1,
                              child: SharedElevatedButton(
                                onPressed: () {},
                                text: LocaleKeys.home_more.tr(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
