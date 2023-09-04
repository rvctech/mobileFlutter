import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'di/app_bindings.dart';
import 'screens/auth/login_screen.dart';

void main() => runApp(const TunyceApp());

class TunyceApp extends StatelessWidget {
  const TunyceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindigs(),
      home: const Scaffold(
        body: LoginBody(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
