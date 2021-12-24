import 'package:flutter/material.dart';
import 'package:refq_mongo/shared/theme/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;

  const LoadingIndicator({Key? key, this.color}) : super(key: key);
  @override
  Widget build(_) => CircularProgressIndicator(
        color: color == null ? AppColors.secondary : color!,
      );
}
