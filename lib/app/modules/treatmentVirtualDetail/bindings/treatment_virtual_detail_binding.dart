import 'package:get/get.dart';

import '../controllers/treatment_virtual_detail_controller.dart';

class TreatmentVirtualDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TreatmentVirtualDetailController>(
      () => TreatmentVirtualDetailController(),
    );
  }
}
