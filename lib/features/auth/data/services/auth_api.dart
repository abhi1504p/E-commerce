import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/core/constant/app_snackbar.dart';
import 'package:shoppingapp/core/network/api_constant.dart';
import 'package:shoppingapp/features/auth/data/model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<bool> registerUser(AuthModel user) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.register);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      // body: jsonEncode(user.toJson()),
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception("Registration failed: ${response.body}");
    }
  }

  Future<bool> loginUser(AuthModel user) async {
    final url = Uri.parse(ApiConstant.baseUrl + ApiConstant.login);
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()),
    );

    final data = jsonDecode(response.body);
    if (data["success"] == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLoggedIn", true);
      return true;
    } else {
      throw Exception("Login failed: ${response.body}");
    }
  }
}
