import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/statusrequest.dart';
import '../../../data/datasource/remote/forgetpassword/checkEmail_data.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
    StatusRequest statusRequest = StatusRequest.none;
    CheckEmailData checkemaildata = CheckEmailData(Get.put(Crud()));

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  goToVerifyCode() {
    var formData = formState.currentState;
  if (formData!.validate()) {
       statusRequest = StatusRequest.loading;
      update();
      var response =  checkemaildata.postData(email.text);
      Get.offNamed(AppRoute.verifyCode);
    } else {
       print(" not valid");
    }
  }

  @override
  checkEmail() {}
}
