import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refq_mongo/app/accepted_injury/accepted_injury_page.dart';
import 'package:refq_mongo/app/more/store/more_store.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';
import 'package:refq_mongo/shared/widgets/loading_layer.dart';
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
              (_store.loading) ? const LoadingLayer() : Container()
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
          Text(
            LocaleKeys.more_dont_be_volunteer.tr(),
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            LocaleKeys.more_user_desc.tr(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.h,
          ),
          SizedBox(
            width: 70.w,
            height: 70.w,
            child: Image.asset(
              Assets.imageSilent,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Center(
              child: SharedOutlinedButton(
                  text: LocaleKeys.more_ok_button.tr(),
                  onPressed: () {
                    _store.onOkButton();
                  })),
          SizedBox(
            height: 100.h,
          ),
          SharedElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AcceptedInjuryPage(),
              ));
            },
            text: LocaleKeys.more_accepted_injuries_button.tr(),
          ),
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
