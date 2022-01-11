import 'package:flutter/material.dart';
import 'package:refq_mongo/app/accepted_injury/store/accepted_injury_store.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';

import 'component/accepted_injury_card.dart';

class AcceptedInjuryPage extends StatefulWidget {
  const AcceptedInjuryPage({Key? key}) : super(key: key);

  @override
  State<AcceptedInjuryPage> createState() => _AcceptedInjuryPageState();
}

class _AcceptedInjuryPageState extends State<AcceptedInjuryPage> {
  final AcceptedInjuryStore _store = AcceptedInjuryStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(horizontalAppPadding),
                    child: Text(
                      LocaleKeys.accepted_injury_accepted_injury.tr(),
                      style: Theme.of(mainContext).textTheme.headline5,
                    ),
                  ),
                ),
                const AppBackButton(),
              ],
            ),
            Observer(builder: (context) {
              return Visibility(
                  visible: _store.loading,
                  child: const CircularProgressIndicator());
            }),
            Observer(builder: (context) {
              return Visibility(
                visible: !_store.loading,
                child: Expanded(
                  child: Visibility(
                    visible: _store.acceptedInjuries.isNotEmpty,
                    child: ListView.builder(
                      itemCount: _store.acceptedInjuries.length,
                      padding: EdgeInsets.only(
                          left: horizontalAppPadding.sp,
                          right: horizontalAppPadding.sp),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return AcceptedInjuryCard(
                            refreshFunction: () {
                              _store.init();
                            },
                            data: _store.acceptedInjuries[index]);
                      },
                    ),
                    replacement: const Center(
                      child: Text("There are no injuries yet"),
                    ),
                  ),
                ),
                replacement: const SizedBox(),
              );
            })
          ],
        ),
      ),
    );
  }
}
