import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:refq_mongo/shared/export_shared.dart';

Future<dynamic> callDialog(context) {
  return showModal(
      configuration: const FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 1000)),
      context: context,
      builder: (context) => CustomDialog(
          title: "There are no volunteers 💔",
          subTitle:
              'Be a volunteer and join us, click more button for more details',
          onCallConfirm: () => {Navigator.of(context).pop()},
          textButtonConfirm: "Ok"));
}

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.textButtonConfirm,
      required this.onCallConfirm})
      : super(key: key);
  final String title;
  final String subTitle;
  final String textButtonConfirm;
  final Function onCallConfirm;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      // backgroundColor: AppColors.BackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadiusCircular,
      ),
      elevation: 10,
      child: Container(
        height: 200.0.h,
        padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 10.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Expanded(
              child: Center(
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            SharedOutlinedButton(
                text: textButtonConfirm,
                onPressed: () {
                  onCallConfirm();
                })
          ],
        ),
      ),
    );
  }
}
