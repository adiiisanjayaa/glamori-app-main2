import 'package:get/get.dart';

import '../controllers/keranjang_page_controller.dart';

class KeranjangPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KeranjangPageController>(
      () => KeranjangPageController(),
    );
  }
}
