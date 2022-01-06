import 'package:flutter/material.dart';
import 'package:refq_mongo/app/injury_details/injury_details_page.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String decription;
  final String date;
  final String? adsImage;
  const NotificationCard(
      {Key? key,
      required this.title,
      required this.decription,
      required this.date,
      required this.adsImage})
      : super(key: key);
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
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InjuryDetailsPage(),
            ),
          );
        },
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
