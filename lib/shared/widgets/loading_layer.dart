import 'package:flutter/material.dart';

class LoadingLayer extends StatelessWidget {
  const LoadingLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
