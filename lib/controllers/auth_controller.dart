import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/repositories/auth_repository.dart';

class AuthController extends GetxController {
  // Login
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _authRepository = AuthRepositoy();
  var isLoading = false.obs;

  setLoading(bool loading) async {
    isLoading.value = loading;
    update();
  }

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

    return res;
  }
}
