import 'package:get/get.dart';

import '../controllers/redeem_page_controller.dart';

class RedeemPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RedeemPageController>(
      () => RedeemPageController(),
    );
  }
}
