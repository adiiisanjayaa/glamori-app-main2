import 'package:get/get.dart';

import '../controllers/faq_page_controller.dart';

class FaqPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqPageController>(
      () => FaqPageController(),
    );
  }
}
