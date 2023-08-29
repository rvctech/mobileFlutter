import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apiservice.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}

class ApiProvider {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> loginUser(String email, String password) {
    return _apiService.loginUser(email, password);
  }
}
