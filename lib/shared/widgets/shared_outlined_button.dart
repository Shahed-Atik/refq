import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/theme/app_colors.dart';
import 'package:refq_mongo/shared/utils/constant.dart';

class SharedOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SharedOutlinedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          primary: Theme.of(context).colorScheme.secondary,
          elevation: 0,
          side: BorderSide(
              width: 1.5, color: Theme.of(context).colorScheme.secondary),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(color: AppColors.grey),
        ),
      ),
    );
  }
}
