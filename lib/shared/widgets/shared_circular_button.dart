import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SharedCircularButton extends StatelessWidget {
  const SharedCircularButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(13.sp),
        child: Icon(icon),
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
    );
  }
}
