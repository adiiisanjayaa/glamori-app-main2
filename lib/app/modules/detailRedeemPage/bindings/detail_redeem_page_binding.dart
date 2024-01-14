import 'package:get/get.dart';

import '../controllers/detail_redeem_page_controller.dart';

class DetailRedeemPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRedeemPageController>(
      () => DetailRedeemPageController(),
    );
  }
}
