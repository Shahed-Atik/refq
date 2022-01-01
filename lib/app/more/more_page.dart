import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refq_mongo/app/more/store/more_store.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';
import 'package:refq_mongo/shared/widgets/shared_elevated_button.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);
  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final MoreStore _store = MoreStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (context) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const AppBackButton(),
                  StorageService().isVolunteer()
                      ? _buildVolunteerBody()
                      : _buildUserBody()
                ],
              ),
              (_store.loading)
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
                  : Container()
            ],
          );
        }),
      ),
    );
  }

  _buildVolunteerBody() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(
            left: horizontalAppPadding.sp,
            right: horizontalAppPadding.sp,
            top: horizontalAppPadding.sp),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            LocaleKeys.more_be_volunteer.tr(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            LocaleKeys.home_enter_location.tr(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
              child:
                  SharedOutlinedButton(text: "Send injury", onPressed: () {})),
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
                    onPressed: () {
                      _store.onOkButton();
                    },
                    text: LocaleKeys.home_more.tr(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildUserBody() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(
            left: horizontalAppPadding.sp,
            right: horizontalAppPadding.sp,
            top: horizontalAppPadding.sp),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            LocaleKeys.more_be_volunteer.tr(),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            LocaleKeys.more_volunteer_desc.tr(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 70.w,
            height: 70.w,
            child: SvgPicture.asset(
              Assets.svgPetsNeedHelp,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          SharedElevatedButton(
            onPressed: () {
              _store.onOkButton();
            },
            text: LocaleKeys.more_ok_button.tr(),
          ),
        ],
      ),
    );
  }
}
