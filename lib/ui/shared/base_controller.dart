import 'package:get/get.dart';

import '../../app/locator.dart';
import '../../repository/repository.dart';
import '../../service/storage_service.dart';

class BaseController extends GetxController {

  final repository = locator<ApiRepository>();
  final storage = locator<StorageService>();


  bool _isBusy = false;

  bool get isBusy => _isBusy;

  setBusy(bool value) {
    _isBusy = value;
    update();
  }


}
