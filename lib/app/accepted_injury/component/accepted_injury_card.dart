import 'package:flutter/material.dart';
import 'package:refq_mongo/app/accepted_injury/repository/accepted_injury_repository.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/network_image.dart';

import '../accepted_injury_details.dart';

class AcceptedInjuryCard extends StatelessWidget {
  final AcceptedInjury data;
  final Function refreshFunction;

  const AcceptedInjuryCard(
      {Key? key, required this.data, required this.refreshFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            useRootNavigator: true,
            isDismissible: true,
            context: context,
            enableDrag: true,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(borderRadius: borderRadiusCircular),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 4 / 5),
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: AcceptedInjuryDetails(
                  refreshFunction: refreshFunction,
                  data: data,
                ),
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: isLight
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).cardColor,
            borderRadius: borderRadiusCircular,
            border: Border.all(color: AppColors.primary),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 7,
                  spreadRadius: 1)
            ],
          ),
          child: ClipRRect(
            borderRadius: borderRadiusCircular,
            child: Column(
              children: [
                buildPostImage(),
                Visibility(
                  visible: data.description != "null",
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.r, horizontal: 10),
                    child: Text(
                      LocaleKeys.notification_injury_reported.tr(),
                      style: Theme.of(context).textTheme.headline6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPostImage() => SizedBox(
        height: 150.0.h,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: borderRadiusCircular,
                child: AppNetworkImage(
                  URL: data.imges[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )),
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                DateFormat('yyyy-MM-dd\nHH:mm').format(data.date).toString(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
