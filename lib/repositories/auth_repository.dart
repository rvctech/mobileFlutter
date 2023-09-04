import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tunyce/core/common/constants.dart';

class AuthRepositoy {
  Future<dynamic> loginUser(String email, String password) async {
    // Call login endopoint

    log("Email: $email");
    log("Password: $password");
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseURL}/authentication/login/v1/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      log('LoginRes: ${response.body}');
      var decodedRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // Success
        return true;
      } else {
        Map<String, dynamic> errorMap = decodedRes;

        // Get error message from the value
        String errorMessage = errorMap.values.first;

        // {"detail":"Invalid credentials try again"}
        return errorMessage;
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
