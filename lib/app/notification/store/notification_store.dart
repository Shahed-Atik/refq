import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/app/injury_details/injury_details_page.dart';
import 'package:refq_mongo/app/notification/repository/notification_repository.dart';
import 'package:refq_mongo/localizations/locale_keys.g.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

import '../../../main.dart';

part 'notification_store.g.dart';

class NotificationStore = NotificationStoreBase with _$NotificationStore;

abstract class NotificationStoreBase with Store {
  NotificationStoreBase() {
    _repository = NotificationRepository(dio);
    init();
  }
  late NotificationRepository _repository;

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

  @action
  onCaseDetails(Case item, BuildContext context) async {
    loading = true;
    try {
      InjuryWithData? response =
          await _repository.getInjury(injuryId: item.post);
      if (response != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InjuryDetailsPage(
              refreshFunction: () {
                init();
              },
              data: response,
            ),
          ),
        );
      }
    } on AppException catch (e) {
      showErrorToast(errorMessage: e.message);
    }
    loading = false;
  }
}
