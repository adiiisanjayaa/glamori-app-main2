import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_card_upload.dart';
import 'package:glamori/app/data/model/model_detail_product.dart';
import 'package:glamori/app/data/services/api_services.dart';
import 'package:glamori/app/data/services/user_services.dart';
import 'package:intl/intl.dart';

class PengirimanPageController extends GetxController {
  List<ModelDetailProduct?>? product;
  String? idUser;
  double subTotal = 0;
  double totalPrice = 0;

  Future<String?> postTransaction(BuildContext context) async {
    if (idUser != null) {
      // Using the ModelCardUpload.fromJson factory method
      List<ProductItems> listItem = [];
      product?.forEach((element) {
        listItem.add(ProductItems(
          category: 'product',
          name: element?.data?.name ?? '',
          price: element?.data?.price ?? 0,
          qty: element?.qty ?? 1,
          discount: 0,
          discountPrice: 0,
          sId: element?.data?.sId,
        ));
      });
      ModelCardUpload cardUpload = ModelCardUpload(
        consultationPrice: 0,
        tax: 10,
        patient: idUser,
        payment: "cash",
        totalPrice: totalPrice,
        items: listItem,
      );

      var result = await ApiServices.postTransaction(modelCard: cardUpload);

      if (result != null) {
        print('berhasil');
        var id = result.data?.transactionId ?? '';

        return id;
      }
    } else {
      print("Belum login ");
    }
    return null;
  }

  String formatPrice(double productPrice) {
    final formatter = NumberFormat.currency(
      symbol: 'Rp.',
      decimalDigits: 0,
      locale: 'id_ID', // Use the locale for Indonesia to ensure dot as thousand separator
    );
    return formatter.format(productPrice);
  }

  String formatPriceNoRp(double productPrice) {
    final formatter = NumberFormat.currency(
      symbol: '',
      decimalDigits: 0,
      locale: 'id_ID', // Use the locale for Indonesia to ensure dot as thousand separator
    );
    return formatter.format(productPrice);
  }

  @override
  void onReady() async {
    try {
      Map<String, dynamic>? arguments = Get.arguments;
      product = arguments?['product'] as List<ModelDetailProduct?>?;
      print(product?.length);
      product?.forEach((element) {
        subTotal += element?.data?.price ?? 0;
      });
      totalPrice = subTotal * 1.1;
    } catch (e) {
      print(e);
    }
    var dataLogin = await UserService.find.getLocalUser();

    if (dataLogin != null) {
      idUser = UserService.find.user?.id ?? '';
    }
    update();

    super.onReady();
  }
}
