import 'package:get/get.dart';

import '../controllers/pesanan_konsultasi_page_controller.dart';

class PesananKonsultasiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesananKonsultasiPageController>(
      () => PesananKonsultasiPageController(),
    );
  }
}
