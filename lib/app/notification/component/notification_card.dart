import 'package:flutter/material.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class NotificationCard extends StatelessWidget {
  final Function() onTapCard;
  const NotificationCard({Key? key, required this.onTapCard}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0.w),
      decoration: BoxDecoration(
        color: isLight
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).cardColor,
        borderRadius: borderRadiusCircular,
        border: Border.all(color: AppColors.primary),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(1.0, 1.0),
              blurRadius: 7,
              spreadRadius: 1)
        ],
      ),
      child: ListTile(
        onTap: onTapCard,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.r),
        title: Text(
          LocaleKeys.notification_injury_reported.tr(),
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(LocaleKeys.notification_click_details.tr()),
        trailing: ClipRRect(
          child: Image.asset(
            "assets/image/googlemaps.jpg",
            width: 80.r,
            height: 80.r,
            fit: BoxFit.fill,
          ),
          borderRadius: borderRadiusCircular,
        ),
      ),
    );
  }
}
