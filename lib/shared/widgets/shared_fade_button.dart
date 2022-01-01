import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refq_mongo/shared/widgets/shared_elevated_button.dart';

class AppFadeButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final double opacity;

  const AppFadeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.r,
      width: MediaQuery.of(context).size.width * 2 / 4,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: opacity,
        child: SharedElevatedButton(
          text: buttonText,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
