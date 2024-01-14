import 'package:get/get.dart';

import '../controllers/promotion_page_controller.dart';

class PromotionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromotionPageController>(
      () => PromotionPageController(),
    );
  }
}
