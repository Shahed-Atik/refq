import 'package:flutter/material.dart';

import '../export_shared.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(horizontalAppPadding),
        child: SharedCircularButton(
          icon: Icons.arrow_back_sharp,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
