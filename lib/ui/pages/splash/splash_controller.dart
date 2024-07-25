import 'package:get/get.dart';

import '../../shared/base_controller.dart';
import '../main/main_view.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    handleStartupLogin();
  }

  void handleStartupLogin() {
    setBusy(true);

    Future.delayed(const Duration(milliseconds: 1000), () async {
      // User? user = await storage.user;
      Get.offAll(() => MainView());
      setBusy(false);
    });
  }
}
