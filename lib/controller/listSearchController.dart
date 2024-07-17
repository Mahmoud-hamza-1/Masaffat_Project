import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:get/get.dart';

abstract class ListSearchController extends GetxController {
  search();
  goToSuccessSignup();
}

class ListSearchControllerImp extends ListSearchController {
  late String verifyCode;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  goToSuccessSignup() {
    Get.offNamed(AppRoute.successSignUP);
  }

  @override
  search(){

  }

}
