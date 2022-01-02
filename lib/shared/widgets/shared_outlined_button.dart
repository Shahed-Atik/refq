import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/utils/constant.dart';

class SharedOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  const SharedOutlinedButton(
      {Key? key, required this.text, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          primary: color ?? themeData.colorScheme.secondary,
          elevation: 0,
          side: BorderSide(
              width: 1.5, color: color ?? themeData.colorScheme.secondary),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
        ),
        child: Text(
          text,
          style: themeData.textTheme.button!
              .copyWith(color: color ?? (isLight ? Colors.amber : null)),
        ),
      ),
    );
  }
}
