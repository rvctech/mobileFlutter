import 'package:flutter/material.dart';
import 'package:tunyce/widgets/primary_button.dart';
import 'package:tunyce/widgets/text_input.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.jpg',
                width: 220,
              ),
              const SizedBox(height: 30),
              const TextInputWidget(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.redAccent,
                ),
                hintText: 'Enter your email',
                labelText: 'Email',
              ),
              const SizedBox(height: 20),
              PrimaryButtonWidget(
                label: 'Reset Password',
                onTap: () async {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
