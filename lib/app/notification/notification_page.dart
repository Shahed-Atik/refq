import 'package:flutter/material.dart';
import 'package:refq_mongo/app/more/store/more_store.dart';
import 'package:refq_mongo/app/notification/component/notification_card.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final MoreStore _store = MoreStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(horizontalAppPadding),
                  child: Text(
                    LocaleKeys.notification_notification.tr(),
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
                  NotificationCard(
                      title: "title",
                      decription: "decription",
                      date: "date",
                      adsImage: "adsImage"),
                  NotificationCard(
                      title: "title",
                      decription: "decription",
                      date: "date",
                      adsImage: "adsImage"),
                  NotificationCard(
                      title: "title",
                      decription: "decription",
                      date: "date",
                      adsImage: "adsImage"),
                  NotificationCard(
                      title: "title",
                      decription: "decription",
                      date: "date",
                      adsImage: "adsImage"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
