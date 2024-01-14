import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_detail_product.dart';
import 'package:glamori/app/data/services/api_services.dart';
import 'package:intl/intl.dart';

class DetailBelanjaPageController extends GetxController {
  ModelDetailProduct? detailProduct;
  getDetailProduct(String id) async {
    var data = await ApiServices().getDetailProduct(id);
    detailProduct = data;
    update();
  }

  String formatPrice(int productPrice) {
    final formatter = NumberFormat.currency(
      symbol: 'Rp.',
      decimalDigits: 0,
      locale: 'id_ID', // Use the locale for Indonesia to ensure dot as thousand separator
    );
    return formatter.format(productPrice);
  }

  @override
  void onInit() async {
    Map<String, dynamic>? arguments = Get.arguments;
    var arg1 = arguments?['productId'];

    getDetailProduct(arg1);

    super.onInit();
  }
}
