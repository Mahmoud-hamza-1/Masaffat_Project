import 'dart:convert';

import 'package:ecommerce_application/controller/auth/login_controller.dart';
import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/core/class/statusrequest.dart';
import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/signup_data.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/main.dart';
import 'package:ecommerce_application/view/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/handling_data.dart';
import 'package:http/http.dart ' as http;

abstract class SignUP2Controller extends GetxController {
  signup();
  goToSignIn();
}

class SignUp2ControllerImp extends SignUP2Controller {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  late TextEditingController username = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  // SignUpData signupData = SignUpData(Get.find());
  List data = [];
  static var token = '';
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void signup() async {
    var response =
        await http.post(Uri.parse(AppLink.signupApi), headers: <String, String>{
      'Accept': 'application/json',
    }, body: {
      'name': username.text,
      'email': email.text,
      'password': password.text,
    });

    print("hello from signup");
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("popopop");
      print(response.body);
      print(response);
      print('ERROR 5');
      Map responseBody = jsonDecode(response.body);
      print('ERROR 6');
      print(responseBody);
      final userData = {
        'name': responseBody['data']['name'],
        'email': responseBody['data']['email'],
        'roleName': responseBody['roleName'],
        'access_token': responseBody['access_token'],
      };
      await sharedStorage.setString('user', jsonEncode(userData));
      Get.off(() => HomePage());
      // return Right(responseBody);
    } else {
      Get.defaultDialog(
        middleText: '${jsonDecode(response.body)["message"]}',
      );
      // Get.to(HomePage());
      //return const Left(StatusRequest.serverFailure);
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }
}







  // @override
  // signup() async {
  //   var formData = formState.currentState;
  //   if (formData!.validate()) {
  //     print("doneeee");
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await signupData.postData(
  //         username.text, password.text, email.text);
  //     print("=============controller $response");
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['message'] == "Register successful!") {
  //         print('--------------------');
  //         // data.addAll(response['data']);
  //        Get.offNamed(AppRoute.successSignUP);
  //       } else {
  //         Get.defaultDialog(
  //             title: "Warning",
  //             middleText: "Phone Number or Email Already Exist");
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();

  //     // Get.delete<SignUpControllerImp>();
  //   } else {
  //     print(" not valid");
  //   }
  // }