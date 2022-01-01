import 'package:mobx/mobx.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

part 'more_store.g.dart';

class MoreStore = MoreStoreBase with _$MoreStore;

abstract class MoreStoreBase with Store {
  MoreStoreBase();

  @observable
  bool loading = false;

  @action
  onOkButton() async {
    loading = true;
    await Future.delayed(const Duration(seconds: 2));
    await StorageService().setUserProfile(!StorageService().isVolunteer());
    loading = false;
  }
}
