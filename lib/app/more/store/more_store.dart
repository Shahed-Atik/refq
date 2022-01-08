import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:refq_mongo/app/more/repository/more_repository.dart';
import 'package:refq_mongo/main.dart';
import 'package:refq_mongo/shared/network/exceptions/app_exception.dart';
import 'package:refq_mongo/shared/services/location_service.dart';
import 'package:refq_mongo/shared/services/storage_service.dart';
import 'package:refq_mongo/shared/widgets/toasts.dart';

part 'more_store.g.dart';

class MoreStore = MoreStoreBase with _$MoreStore;

abstract class MoreStoreBase with Store {
  MoreStoreBase() {
    _repository = MoreRepository(dio);
  }

  late MoreRepository _repository;
  @observable
  bool loading = false;

  @action
  onOkButton() async {
    loading = true;
    try {
      if (!StorageService().isVolunteer()) {
        //set as Volunteer
        Position _myLocation = await LocationService().getLocation();
        String userId = await _repository.setVolunteer(loc: _myLocation);
        await StorageService().setUserId(userId);
        await StorageService().setUserProfile(true);
        showSuccessToast(message: "You're a Volunteer now 🥳");
      } else {
        //remove Volunteer
        await _repository.removeVolunteer();
        await StorageService().setUserProfile(false);
        showSuccessToast(message: "You're not a Volunteer now 😞");
      }
    } on AppException catch (e) {
      showErrorToast(errorMessage: e.message);
    }
    loading = false;
  }
}
