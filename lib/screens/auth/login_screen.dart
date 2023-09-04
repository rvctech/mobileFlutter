import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tunyce/controllers/auth_controller.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/core/common/constants.dart';
import 'package:tunyce/di/app_bindings.dart';
import 'package:tunyce/screens/auth/forgotpassword.dart';
import 'package:tunyce/screens/main_screen.dart';
import 'package:tunyce/screens/auth/signup_screen.dart';
import 'package:tunyce/widgets/primary_button.dart';
import 'package:tunyce/widgets/text_input.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.transparent), // Remove border
                    ),
                    child:
                        Image.asset(Constants.appLogo, width: 270, height: 240),
                  ),
                  const SizedBox(height: 20),
                  TextInputWidget(
                    controller: controller.emailController,
                    prefixIcon: const Icon(
                      Icons.account_box_outlined,
                      color: Colors.redAccent,
                    ),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextInputWidget(
                      controller: controller.passwordController,
                      obscureText: controller.isPassObscure.value,
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: Colors.redAccent,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.isSignUpPassObscure.toggle();
                        },
                        child: Icon(
                          (controller.isPassObscure.value)
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()));
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  PrimaryButtonWidget(
                    label: 'Login',
                    onTap: () async {
                      if (!controller.loginFormKey.currentState!.validate()) {
                        return;
                      }
                      var res = await controller.loginUser();

                      if (res == true) {
                        Get.offAll(
                          () => const MainScreen(),
                          binding: AppBindigs(),
                        );
                      } else {
                        Fluttertoast.showToast(
                            msg: "$res",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(color: Colors.grey),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const SignUpScreen());
                        },
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const SignUpScreen());
                            },
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
