import 'package:get/get.dart';
import '../controllers/root_page_controller.dart';

class RootPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RootPageController>(
      RootPageController(),
    );
  }
}
