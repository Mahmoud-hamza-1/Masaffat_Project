import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/view/screen/homepage.dart';
import 'package:get/get.dart';

import '../../view/screen/listSearch.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
  gotohome();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(AppRoute.login);
  }


 @override
  gotohome() {
   // Get.offAll(ListSearch());
   Get.to(HomePage());
  }

}
