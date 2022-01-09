import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/app/accepted_injury/repository/accepted_injury_repository.dart';
import 'package:refq_mongo/localizations/locale_keys.g.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

import '../../../main.dart';

part 'accepted_injury_store.g.dart';

class AcceptedInjuryStore = AcceptedInjuryStoreBase with _$AcceptedInjuryStore;

abstract class AcceptedInjuryStoreBase with Store {
  AcceptedInjuryStoreBase() {
    _repository = AcceptedInjuryRepository(dio);
  }
  late AcceptedInjuryRepository _repository;

  @observable
  bool loading = false;

  @observable
  List<Case> cases = [];

  init() async {
    loading = true;
    try {
      cases = await _repository.getInjuries() ?? [];
      showSuccessToast(
          message: LocaleKeys.message_successToastDefaultMessage.tr());
    } on AppException catch (e) {
      showErrorToast(errorMessage: e.message);
    }
    loading = false;
  }
  //
  // @action
  // onCaseDetails(Case item, BuildContext context) async {
  //   loading = true;
  //   try {
  //     InjuryWithData? response =
  //     await _repository.getInjury(injuryId: item.post);
  //     if (response != null) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => InjuryDetailsPage(
  //             refreshFunction: () {
  //               init();
  //             },
  //             data: response,
  //           ),
  //         ),
  //       );
  //     }
  //   } on AppException catch (e) {
  //     showErrorToast(errorMessage: e.message);
  //   }
  //   loading = false;
  // }
}
