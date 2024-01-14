import 'package:get/get.dart';

import '../controllers/treatment_onsite_detail_controller.dart';

class TreatmentOnsiteDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TreatmentOnsiteDetailController>(
      () => TreatmentOnsiteDetailController(),
    );
  }
}
