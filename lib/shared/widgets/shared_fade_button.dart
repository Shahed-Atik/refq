import 'package:flutter/material.dart';
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
      height: 110,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 700),
        opacity: opacity,
        child: Padding(
          padding: const EdgeInsets.only(left: 70, bottom: 16, right: 70),
          child: SharedElevatedButton(
            text: buttonText,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
