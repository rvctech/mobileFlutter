import 'package:flutter/material.dart';
import 'package:tunyce/controllers/base_controller.dart';
import 'package:tunyce/models/login_model.dart';
import 'package:tunyce/repositories/auth_repository.dart';

class AuthController extends BaseController {
  // Login
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _authRepository = AuthRepositoy();

  LoginData? _currentUser;
  LoginData? get currentUser => _currentUser;

  @override
  onInit() async {
    emailController.text = 'matatu@gmail.com';
    passwordController.text = "Hope2022*";
    super.onInit();
  }

  // const email = "matatu@gmail.com"; // Replace with user's input
  // const password = "Hope2022*"; // Replace with user's input

  Future<dynamic> loginUser() async {
    setLoading(true);
    var res = await _authRepository.loginUser(
      emailController.text,
      passwordController.text,
    );
    setLoading(false);
    if (res is LoginData) {
      _currentUser = res;
      return true;
    }
  }
}
