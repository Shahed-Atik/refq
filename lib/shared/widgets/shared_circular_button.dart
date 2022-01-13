import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/export_shared.dart';

class SharedCircularButton extends StatelessWidget {
  const SharedCircularButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.background,
      this.iconColor})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;
  final Color? background;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(13.sp),
        child: Icon(
          icon,
          color: iconColor,
        ),
        decoration: BoxDecoration(
            color: background ?? Theme.of(context).cardColor,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 7,
                  spreadRadius: 1)
            ]),
      ),
    );
  }
}
