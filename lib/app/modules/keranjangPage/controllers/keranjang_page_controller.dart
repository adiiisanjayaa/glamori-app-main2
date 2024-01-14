import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_detail_product.dart';
import 'package:glamori/utils/sqlite_helper.dart';

class KeranjangPageController extends GetxController {
  bool isAllChecked = false;
  List<ModelDetailProduct> carts = [];

  @override
  void onReady() {
    getCart();
    super.onReady();
  }

  void checkListAll(bool? value) async {
    isAllChecked = value ?? false;
    update();

    var sqlHelper = await SqlLiteHelper.instance.cartTable;
    var result = await sqlHelper.updateCheckedAllProduct(isAllChecked ? 1 : 0);

    getCart();
  }

  void updateCheckboxValue(String id, int check) async {
    var sqlHelper = await SqlLiteHelper.instance.cartTable;
    var result = await sqlHelper.updateCheckedProduct(id, check);

    if (result == 1) {
      getCart();
    }
  }

  getCart() async {
    var sqlHelper = await SqlLiteHelper.instance.cartTable;
    carts = await sqlHelper.getAllCart();
    print(carts.length);

    update();
  }

  updateQty(String id, int qty) async {
    var sqlHelper = await SqlLiteHelper.instance.cartTable;
    var result = await sqlHelper.updateQtyProduct(id, qty);
    if (result == 1) {
      getCart();
    }
  }

  deleteCart() async {
    var sqlHelper = await SqlLiteHelper.instance.cartTable;
    await sqlHelper.deleteCartProduct();
    getCart();
    Get.back();
  }
}

class CheckboxItem {
  bool value;

  CheckboxItem({required this.value});
}
