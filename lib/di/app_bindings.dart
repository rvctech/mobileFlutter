import 'package:get/get.dart';
import 'package:tunyce/controllers/auth_controller.dart';

class AppBindigs extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
