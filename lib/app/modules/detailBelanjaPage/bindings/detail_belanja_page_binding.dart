import 'package:get/get.dart';

import '../controllers/detail_belanja_page_controller.dart';

class DetailBelanjaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBelanjaPageController>(
      () => DetailBelanjaPageController(),
    );
  }
}
