import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tunyce/core/common/constants.dart';
import 'package:tunyce/models/login_model.dart';

class AuthRepositoy {
  Future<dynamic> createAccount(Map<String, dynamic> signUpPayload) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseURL}/authentication/login/v1/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(signUpPayload),
      );
      log("response.body: ${response.body}");
      var decodedRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        Map<String, dynamic> errorMap = decodedRes;

        // Get error message from the value
        String errorMessage = errorMap.values.first;

        // {"detail":"Invalid credentials try again"}
        return errorMessage;
      }
    } on SocketException catch (e) {
      log('SocketException: $e');
      throw 'Check your internet connection';
    } catch (e) {
      log('Error: $e');
      return 'Error: $e';
    }
  }

  Future<dynamic> loginUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseURL}/authentication/login/v1/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      log("response.body: ${response.body}");
      var decodedRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final loginData = loginDataFromJson(response.body);

        await prefs.setString('access_token', '${loginData.access}');
        return loginData;
      } else {
        Map<String, dynamic> errorMap = decodedRes;

        // Get error message from the value
        String errorMessage = errorMap.values.first;

        // {"detail":"Invalid credentials try again"}
        return errorMessage;
      }
    } on SocketException catch (e) {
      log('Error: $e');
      throw 'Check your internet connection';
    } catch (e) {
      log('Error: $e');
      return 'Error: $e';
    }
  }
}
