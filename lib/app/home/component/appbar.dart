import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refq_mongo/app/notification/notification_page.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.home_title.tr(),
          style: Theme.of(context).textTheme.headline5,
        ),
        Visibility(
          visible: StorageService().isVolunteer(),
          child: SharedCircularButton(
            icon: Icons.notifications,
            background: isLight
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).cardColor,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ));
            },
          ),
          replacement: SizedBox(
            height: 50.h,
          ),
        ),
      ],
    );
  }
}
