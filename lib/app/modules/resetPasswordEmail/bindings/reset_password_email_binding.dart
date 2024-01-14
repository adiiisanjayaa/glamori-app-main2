import 'package:get/get.dart';

import '../controllers/reset_password_email_controller.dart';

class ResetPasswordEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordEmailController>(
      () => ResetPasswordEmailController(),
    );
  }
}
