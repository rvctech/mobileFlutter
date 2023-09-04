import 'package:get/get.dart';
import 'package:tunyce/controllers/auth_controller.dart';
import 'package:tunyce/controllers/base_controller.dart';
import 'package:tunyce/controllers/home_controller.dart';

class AppBindigs extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
  }
}
