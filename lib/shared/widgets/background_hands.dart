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
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            isLight ? Assets.imageBackgroundWithHands : Assets.imageHands,
            fit: isLight ? BoxFit.fill : null,
            width: isLight
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 2 / 3,
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        child
      ],
    );
  }
}
