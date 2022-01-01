import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:refq_mongo/shared/export_shared.dart';

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
        SharedCircularButton(
          icon: Icons.notifications,
          background: isLight
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).cardColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
