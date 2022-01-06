import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/theme/app_colors.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/network_image.dart';

class InjuryImage extends StatelessWidget {
  final String image;
  final double imageSize;
  final Function() onTap;
  const InjuryImage(
      {Key? key,
      required this.image,
      this.imageSize = 150.0,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (imageSize + imageSize).r,
        height: imageSize.r,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: borderRadiusCircular,
          border: Border.all(color: AppColors.grey),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(1.0, 1.0),
                blurRadius: 7,
                spreadRadius: 1)
          ],
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                AppColors.lightBlue1,
                AppColors.fourthColor_light,
                AppColors.lightYellow
              ]),
        ),
        padding: EdgeInsets.all(3.0.sp),
        child: ClipRRect(
            borderRadius: borderRadiusCircular,
            child: AppNetworkImage(
              URL: image,
              width: (imageSize + imageSize).r,
              height: imageSize.r,
            )),
      ),
    );
  }
}
