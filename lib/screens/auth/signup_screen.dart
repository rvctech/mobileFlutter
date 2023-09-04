import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tunyce/controllers/auth_controller.dart';
import 'package:tunyce/core/common/app_colors.dart';
import 'package:tunyce/core/common/constants.dart';
import 'package:tunyce/widgets/primary_button.dart';
import 'package:tunyce/widgets/text_input.dart';

class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
            child: Form(
              key: controller.signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      Constants.appLogo,
                      width: 220,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextInputWidget(
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    hintText: 'First Name',
                    labelText: 'First Name',
                  ),
                  const SizedBox(height: 16),
                  const TextInputWidget(
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    hintText: 'Middle Name',
                    labelText: 'Middle Name',
                  ),
                  const SizedBox(height: 16),
                  const TextInputWidget(
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    hintText: 'Last Name',
                    labelText: 'Last Name',
                  ),
                  const SizedBox(height: 16),
                  const TextInputWidget(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.primaryColor,
                    ),
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextInputWidget(
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: AppColors.primaryColor,
                      ),
                      hintText: 'Password',
                      labelText: 'Password',
                      obscureText: controller.isSignUpPassObscure.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.isSignUpPassObscure.toggle();
                        },
                        child: Icon(
                          (controller.isSignUpPassObscure.value)
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => TextInputWidget(
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: AppColors.primaryColor,
                      ),
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                      obscureText: controller.isConfirmPassObscure.value,
                      suffixIcon: InkWell(
                        onTap: () {
                          controller.isConfirmPassObscure.toggle();
                        },
                        child: Icon(
                          (controller.isConfirmPassObscure.value)
                              ? MdiIcons.eyeOutline
                              : MdiIcons.eyeOffOutline,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => PrimaryButtonWidget(
                      label: 'Sign Up',
                      isLoading: controller.isLoading.value,
                      onTap: () async {
                        // await controller.createAccount();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
