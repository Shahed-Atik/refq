import 'package:flutter/material.dart';
import 'package:refq_mongo/generated/assets.dart';

class BackgroundWithHands extends StatelessWidget {
  final Widget child;
  final bool? showBackButton;

  const BackgroundWithHands(
      {Key? key, required this.child, this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? Assets.imageBackgroundWithHands
              : Assets.imageHands,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        child
      ],
    );
  }
}
