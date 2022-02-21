import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:starbucks_redesign/core/network_controller/network_viewmodel.dart';
import 'package:starbucks_redesign/view/auth/login/viewmodel/login_viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewmodel());
    Get.lazyPut(() => NetworkViewModel());
  }
}
