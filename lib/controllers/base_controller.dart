import 'package:get/get.dart';

class BaseController extends GetxController {
  var isLoading = false.obs;

  setLoading(bool loading) async {
    isLoading.value = loading;
    update();
  }
}
