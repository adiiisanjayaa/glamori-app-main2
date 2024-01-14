import 'package:get/get.dart';

import '../controllers/create_password_page_controller.dart';

class CreatePasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePasswordPageController>(
      () => CreatePasswordPageController(),
    );
  }
}
