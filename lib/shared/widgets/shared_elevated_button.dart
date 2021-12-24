import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/theme/app_colors.dart';
import 'package:refq_mongo/shared/utils/constant.dart';

class SharedElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SharedElevatedButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.sp),
      child: ElevatedButton(
        onPressed: onPressed,
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(stops: const [
              0.1,
              0.8,
            ], colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ]),
            borderRadius: borderRadiusCircular,
          ),
          child: Container(
            padding: EdgeInsets.all(20.sp),
            alignment: Alignment.center,
            child: Text(
              text.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: AppColors.lightColor),
            ),
          ),
        ),
      ),
    );
  }
}
