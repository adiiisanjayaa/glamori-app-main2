import 'package:get/get.dart';

import '../controllers/pengiriman_page_controller.dart';

class PengirimanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengirimanPageController>(
      () => PengirimanPageController(),
    );
  }
}
