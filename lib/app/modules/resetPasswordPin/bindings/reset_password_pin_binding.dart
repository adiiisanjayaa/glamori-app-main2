import 'package:get/get.dart';

import '../controllers/reset_password_pin_controller.dart';

class ResetPasswordPinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordPinController>(
      () => ResetPasswordPinController(),
    );
  }
}
