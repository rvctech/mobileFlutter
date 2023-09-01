import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tunyce/constants.dart';

class AuthRepositoy {

  Future<dynamic> loginUser(String email, String password) async{
    // Call login endopoint
    try {
      final response = await http.post(
        Uri.parse(
            '${Constants.baseURL}/authentication/login/v1/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Success


      }
    } catch (e) {
      log('Error: $e');
    }
  }
}