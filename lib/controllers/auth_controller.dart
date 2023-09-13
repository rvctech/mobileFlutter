import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/controllers/base_controller.dart';
import 'package:tunyce/models/login_model.dart';
import 'package:tunyce/repositories/auth_repository.dart';

class AuthController extends BaseController {
  // Login
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPassObscure = true.obs;

  // Sign up
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailSignUpController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isSignUpPassObscure = true.obs;
  var isConfirmPassObscure = true.obs;

  final _authRepository = AuthRepositoy();

  LoginData? _currentUser;
  LoginData? get currentUser => _currentUser;

  @override
  onInit() async {
    emailController.text = 'matatu@gmail.com';
    passwordController.text = "Hope2022*";
    super.onInit();
  }

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

  Future<dynamic> createAccount() async {
    setLoading(true);
    var res = await _authRepository.createAccount({
      'first_name': firstNameController.text,
      'middle_name': middleNameController.text,
      'last_name': lastNameController.text,
      'email': emailSignUpController.text,
      'password': signUpPasswordController.text,
      'hesquserrole': 8,
      'address': 'Nairobi',
    });
    setLoading(false);
    if (res == true) {
      emailController.text = emailSignUpController.text;
      passwordController.text = signUpPasswordController.text;
    }
    return res;
  }
}
