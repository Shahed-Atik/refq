import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:refq_mongo/app/accepted_injury/repository/accepted_injury_repository.dart';
import 'package:refq_mongo/app/accepted_injury/store/accepted_injury_details_store.dart';
import 'package:refq_mongo/app/injury_details/component/injury_location.dart';
import 'package:refq_mongo/shared/export_shared.dart';
import 'package:refq_mongo/shared/widgets/app_back_button.dart';
import 'package:refq_mongo/shared/widgets/shared_text_field.dart';

class AcceptedInjuryDetails extends StatefulWidget {
  const AcceptedInjuryDetails(
      {Key? key, required this.data, required this.refreshFunction})
      : super(key: key);
  final AcceptedInjury data;
  final Function refreshFunction;
  @override
  State<AcceptedInjuryDetails> createState() => _AcceptedInjuryDetailsState();
}

class _AcceptedInjuryDetailsState extends State<AcceptedInjuryDetails> {
  final AcceptedInjuryDetailsStore _store = AcceptedInjuryDetailsStore();
  late bool _canEdit;
  final List<Injury> _mainInjuries = [
    Injury(k: "injury", v: "burning"),
    Injury(k: "injury", v: "broken"),
    Injury(k: "injury", v: "kitten"),
    Injury(k: "injury", v: "accident"),
    Injury(k: "injury", v: "missing pet"),
  ];
  @override
  void initState() {
    _store.onInit(data: widget.data, refreshFunction: widget.refreshFunction);
    _canEdit = widget.data.injuries.isEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(horizontalAppPadding),
                    child: Text(
                      LocaleKeys.injury_details_injury_details.tr(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const AppBackButton(),
                ],
              ),
              Expanded(
                child: ReactiveForm(
                  formGroup: _store.form,
                  child: ListView(
                    padding: EdgeInsets.only(
                        left: horizontalAppPadding.sp,
                        right: horizontalAppPadding.sp),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        LocaleKeys.injury_details_injury_location.tr(),
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InjuryLocation(
                        store: _store,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "injury case",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.start,
                      ),
                      Visibility(
                        visible: _canEdit,
                        child: Observer(builder: (context) {
                          return ChipsChoice<Injury>.multiple(
                            padding: EdgeInsets.zero,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 0,
                            runSpacing: 0,
                            value: _store.injuries.toList(),
                            onChanged: _store.onInjuryChipsChanged,
                            choiceItems: C2Choice.listFrom<Injury, Injury>(
                              source: _mainInjuries,
                              value: (i, v) => v,
                              label: (i, v) => v.v,
                              disabled: (index, item) => false,
                            ),
                            choiceStyle: C2ChoiceStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              padding: EdgeInsets.zero,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            wrapped: true,
                          );
                        }),
                        replacement: ChipsChoice<Injury>.multiple(
                          padding: EdgeInsets.zero,
                          mainAxisSize: MainAxisSize.min,
                          spacing: 0,
                          runSpacing: 0,
                          value: _store.injuries.toList(),
                          onChanged: (_) {},
                          choiceItems: C2Choice.listFrom<Injury, Injury>(
                            source: _store.injuries.toList(),
                            value: (i, v) => v,
                            label: (i, v) => v.v,
                            disabled: (index, item) => true,
                          ),
                          choiceStyle: C2ChoiceStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.zero,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                          ),
                          wrapped: true,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SharedTextField(
                        readOnly: !_canEdit,
                        maxLines: 4,
                        hintText: "About injury",
                        validationMessages: (control) => {
                          ValidationMessage.required:
                              "Enter description please",
                        },
                        formControlName: 'desc',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Visibility(
                          visible: _canEdit,
                          child: SharedOutlinedButton(
                            color: AppColors.thirdColor,
                            text: "Update Details",
                            onPressed: () => {_store.onSendDetails(context)},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Observer(
          builder: (context) => (_store.loading)
              ? Positioned.fill(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Container(),
        )
      ],
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
