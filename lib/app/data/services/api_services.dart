import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:glamori/app/config/api_interface.dart';
import 'package:glamori/app/data/model/model_card_upload.dart';
import 'package:glamori/app/data/model/model_detail_product.dart';
import 'package:glamori/app/data/model/model_edit_profile.dart';
import 'package:glamori/app/data/model/model_get_all_product.dart';
import 'package:glamori/app/data/model/model_get_profile.dart';
import 'package:glamori/app/data/model/model_login.dart';
import 'package:glamori/app/data/model/model_post_transaction.dart';
import 'package:glamori/app/data/model/model_register.dart';

class ApiServices {
  static Future<ModelLogin?> login({required String phone, required String password}) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/login/member';
    Response? result;
    EasyLoading.show();
    try {
      result = await dio.post(url, data: {
        'phone': phone,
        'password': password,
      });
    } on DioException catch (e) {
      // print("catch:: ");
      // log(e.response);
      EasyLoading.showError(e.response?.data['message']);
      return null;
    }
    if (result.statusCode == 200 || result.statusCode == 201) {
      var modelAuth = ModelLogin.fromJson(result.data);
      if (modelAuth.message == "Login Success") {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(modelAuth.message.toString());
      } else if (modelAuth.message == "Invalid password") {
        EasyLoading.showError(modelAuth.message.toString());
      }
      return modelAuth;
    } else {
      var modelAuth = ModelLogin.fromJson(result.data);
      EasyLoading.showError(modelAuth.message.toString());
      return null;
    }
  }

  static Future<ModelRegister?> register({required String fullname, required String gender, required String password, required String birthdate, required String phone, required String email}) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/register/member';
    Response? result;
    EasyLoading.show();
    try {
      result = await dio.post(url, data: {
        'fullname': fullname,
        'gender': gender,
        'birthdate': birthdate,
        'email': email,
        'phone': phone,
        'password': password,
      });
    } on DioException catch (e) {
      // print("catch:: ");
      // print(e.response);
      EasyLoading.showError(e.response?.data['message']);
      return null;
    }
    if (result.statusCode == 200 || result.statusCode == 201) {
      var modelAuth = ModelRegister.fromJson(result.data);
      if (modelAuth.message == "Successfully Register Account") {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(modelAuth.message.toString());
      }
      return modelAuth;
    } else {
      var modelAuth = ModelRegister.fromJson(result.data);
      EasyLoading.showError(modelAuth.message.toString());
      return null;
    }
  }

  Future<ModelGetProfile?> getProfile(String id) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/profile/$id';

    try {
      Response response = await dio.get(url);
      // print(response.data);
      if (response.statusCode == 200) {
        var modelAllUser = ModelGetProfile.fromJson(response.data);

        return modelAllUser;
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

  Future<ModelDetailProduct?> getDetailProduct(String id) async {
    EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    Dio dio = ApiInterface.instance.api;
    String url = 'product/$id';

    try {
      Response response = await dio.get(url);
      // print(response.data);
      if (response.statusCode == 200) {
        var modelDetail = ModelDetailProduct.fromJson(response.data);
        EasyLoading.dismiss();
        return modelDetail;
      } else {
        EasyLoading.dismiss();
        return null;
      }
    } catch (e) {
      // print(e);
      EasyLoading.dismiss();
      return null;
    }
  }

  static Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
    String? id,
  }) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/change-password/$id';
    Response? result;

    try {
      result = await dio.patch(url, data: {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      });
      return true;
    } on DioException catch (e) {
      // print("catch:: ");
      // print(e.response);
      EasyLoading.showError(e.response?.data['message']);
      return false;
    }
  }

  static Future<bool> editProfile({
    required String fullname,
    required String gender,
    required String birthdate,
    required String phone,
    required String email,
    String? id,
  }) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/profile/$id';
    Response? result;

    try {
      result = await dio.patch(url, data: {
        'fullname': fullname,
        'gender': gender,
        'birthdate': birthdate,
        'email': email,
        'phone': phone,
      });
    } on DioException catch (e) {
      // print("catch:: ");
      // print(e.response);
      EasyLoading.showError(e.response?.data['message']);
      return false;
    }
    if (result.statusCode == 200 || result.statusCode == 201) {
      var modelEdit = ModelEditProfile.fromJson(result.data);

      EasyLoading.dismiss();
      EasyLoading.showSuccess(modelEdit.message.toString());

      return true;
    } else {
      var modelAuth = ModelRegister.fromJson(result.data);
      EasyLoading.showError(modelAuth.message.toString());
      return false;
    }
  }

  static Future<void> uploadImage({
    String? imagePath,
    String? id,
  }) async {
    Dio dio = Dio();
    String uploadUrl = 'https://glamori-be.vercel.app/api/auth/profile/$id';

    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath ?? '', filename: 'image.jpg'),
      });

      Response response = await dio.post(
        uploadUrl,
        data: formData,
        queryParameters: {'path': imagePath}, // Pass image path as a query parameter
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
        print('Server response: ${response.data}');
      } else {
        print('Image upload failed with status code: ${response.statusCode}');
      }
    } on DioError catch (e) {
      print('DioError: $e');
      print('Error message: ${e.response?.data}');
    }
  }

  static Future<bool> editImageProfile({
    required File? image,
    String? id,
  }) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'auth/profile/$id';

    try {
      if (image != null && image.existsSync()) {
        FormData formData = FormData.fromMap({
          'image': await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
        });

        Response response = await dio.patch(url, data: formData);

        if (response.statusCode == 200 || response.statusCode == 201) {
          var modelEdit = ModelEditProfile.fromJson(response.data);

          EasyLoading.dismiss();
          EasyLoading.showSuccess(modelEdit.message.toString());

          return true;
        } else {
          print('Image upload failed with status code: ${response.statusCode}');
          return false;
        }
      } else {
        print('Image file does not exist');
        return false;
      }
    } on DioError catch (e) {
      print('DioError: $e');
      EasyLoading.showError(e.response?.data['message']);
      return false;
    }
  }

  Future<ModelGetAllProduct?> getAllProduct() async {
    Dio dio = ApiInterface.instance.api;
    String url = 'product';

    try {
      Response response = await dio.get(url);
      // print(response.data);
      if (response.statusCode == 200) {
        var modelGetAllProduct = ModelGetAllProduct.fromJson(response.data);

        return modelGetAllProduct;
      } else {
        return null;
      }
    } catch (e) {
      // print(e);
      return null;
    }
  }

  static Future<ModelPostTransaction?> postTransaction({required ModelCardUpload modelCard}) async {
    Dio dio = ApiInterface.instance.api;
    String url = 'transaction';
    Response? result;

    // EasyLoading.show();
    try {
      result = await dio.post(url, data: modelCard.toJson());
    } on DioException catch (e) {
      // print("catch:: ");
      // print(e.response);
      EasyLoading.showError(e.response?.data['message']);
      return null;
    }
    if (result.statusCode == 200 || result.statusCode == 201) {
      var modelAuth = ModelPostTransaction.fromJson(result.data);
      if (modelAuth.message == "Login Success") {
        EasyLoading.dismiss();
        EasyLoading.showSuccess(modelAuth.message.toString());
      } else if (modelAuth.message == "Invalid password") {
        EasyLoading.showError(modelAuth.message.toString());
      }
      return modelAuth;
    } else {
      var modelAuth = ModelLogin.fromJson(result.data);
      EasyLoading.showError(modelAuth.message.toString());
      return null;
    }
  }
}
