import 'package:get/get.dart';
import 'package:glamori/app/modules/treatmentDetail/controllers/treatment_detail_controller.dart';

class TreatmentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TreatmentDetailController>(
      TreatmentDetailController(),
    );
  }
}
