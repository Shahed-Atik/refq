import 'package:mobx/mobx.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';

part 'notification_store.g.dart';

class NotificationStore = NotificationStoreBase with _$NotificationStore;

abstract class NotificationStoreBase with Store {
  NotificationStoreBase();

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
