import 'package:flutter/material.dart';
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
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0.w),
      decoration: BoxDecoration(
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
      child: Container(),
    );
  }
}
