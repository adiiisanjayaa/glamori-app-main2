import 'package:get/get.dart';
import 'package:glamori/app/data/services/user_services.dart';

class MainBinding {
  static init() {
    Get.lazyPut(
      () => UserService(),
    );
  }
}
