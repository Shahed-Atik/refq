import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:refq_mongo/generated/assets.dart';
import 'package:refq_mongo/shared/widgets/loading_indicator.dart';

class AppNetworkImage extends StatelessWidget {
  final String URL;
  final double height;
  final double width;
  final BoxFit fit;
  const AppNetworkImage(
      {Key? key,
      required this.URL,
      required this.width,
      required this.height,
      this.fit = BoxFit.cover})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CachedNetworkImage(
        imageUrl: URL,
        fit: fit,
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
            width: width * 0.5,
            height: height * 0.5,
            child: const Center(child: LoadingIndicator())),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.h),
              child: SvgPicture.asset(
                Assets.logoLightLogo,
                height: 50.0.r,
                width: 50.0.r,
                // color: AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
