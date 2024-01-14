import 'dart:convert';

import 'package:glamori/app/data/model/model_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String userKey = 'userKey';

  // Save user data to SharedPreferences
  static Future<void> saveUser(ModelUser user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userKey, jsonEncode(user.toJson()));
  }

  // Load user data from SharedPreferences
  static Future<ModelUser?> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userData = prefs.getString(userKey);

    if (userData != null) {
      try {
        final Map<String, dynamic> userMap = jsonDecode(userData);
        return ModelUser.fromJson(userMap);
      } catch (e) {
        print("Error decoding user data: $e");
      }
    }

    return null;
  }
}
