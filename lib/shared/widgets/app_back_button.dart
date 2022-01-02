import 'package:flutter/material.dart';

import '../export_shared.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(horizontalAppPadding),
        child: SharedCircularButton(
          background: isLight
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).cardColor,
          icon: Icons.arrow_forward,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
