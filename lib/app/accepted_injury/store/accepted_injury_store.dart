import 'package:easy_localization/easy_localization.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/app/accepted_injury/repository/accepted_injury_repository.dart';
import 'package:refq_mongo/localizations/locale_keys.g.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/utils/constant.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

part 'accepted_injury_store.g.dart';

class AcceptedInjuryStore = AcceptedInjuryStoreBase with _$AcceptedInjuryStore;

abstract class AcceptedInjuryStoreBase with Store {
  AcceptedInjuryStoreBase() {
    _repository = AcceptedInjuryRepository(dio);
    init();
  }
  late AcceptedInjuryRepository _repository;

  @observable
  bool loading = false;

  @observable
  List<AcceptedInjury> acceptedInjuries = [];

  init() async {
    loading = true;
    try {
      acceptedInjuries = await _repository.getAcceptedInjuries() ?? [];
      showSuccessToast(
          message: LocaleKeys.message_successToastDefaultMessage.tr());
    } on AppException catch (e) {
      showErrorToast(errorMessage: e.message);
    }
    loading = false;
  }
}
