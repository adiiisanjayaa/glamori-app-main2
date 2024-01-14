import 'package:get/get.dart';

import '../controllers/treatment_pages_controller.dart';

class TreatmentPagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TreatmentPagesController>(
      () => TreatmentPagesController(),
    );
  }
}
