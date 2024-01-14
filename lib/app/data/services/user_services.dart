import 'dart:convert';
import 'package:get/get.dart';
import 'package:glamori/app/data/model/model_user.dart';
import 'package:glamori/app/data/storage_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends GetxService {
  ModelUser? user;

  Future<ModelUser?> getLocalUser() async {
    user = null;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString(StorageName.userKey);
    if (userData != null) {
      try {
        user = ModelUser.fromJson(json.decode(userData.toString()));
      } catch (e) {
        print("error parse user $e");
      }
    }

    return user;
  }

  static UserService get find => Get.find();
}
