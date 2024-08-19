import 'dart:convert';

import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/view/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusrequest.dart';
import '../../data/datasource/remote/auth/login_data.dart';
import '../../data/handling_data.dart';
import 'package:http/http.dart ' as http;

abstract class Login2Controller extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class Login2ControllerImp extends Login2Controller {
  static var token = '';
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  //LoginData loginData = LoginData(Get.find());
  bool isShow = true;
  StatusRequest statusRequest = StatusRequest.none;
  var emailFocus = new FocusNode();
  var passFocus = new FocusNode();

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void login() async {
    print("start from here");
    String url = "http://10.0.2.2:8000/api/login";

    var response = await http.post(Uri.parse(url), headers: <String, String>{
      'Accept': 'application/json',
    },
     body: {
      'email': email.text,
      'password': password.text,
    });


    print("hello from this line");
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("popopop");
      print(response.body);
      print(response);
      print('ERROR 5');
      Map responseBody = jsonDecode(response.body);
      print('ERROR 6');
      print(responseBody);
      Get.to(HomePage());
      // return Right(responseBody);
    } else {
      Get.defaultDialog(
        title: 'serverFailure',
        middleText: 'incorrect Password or Email',
      );
     // Get.to(HomePage());
      //return const Left(StatusRequest.serverFailure);
    }
          //Get.to(HomePage());

    
    }





  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    isShow = isShow == true ? false : true;
    update();
  }
}








// print("jjjjjjjjjjjjj");
// print(email.text);

// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// print("aaaaaaaaaaaaa");

// if (response.statusCode == 200|| response.statusCode == 201) {
//   print("ssssssssssss");
//   print(await response.stream.bytesToString());
//   Get.to(HomePage());
// }
// else {
//   print("dddddddddddd");
//   print(response.reasonPhrase);
// }
  

  // @override
  // login() async {
  //   var formData = formState.currentState;
  //   if (formData!.validate()) {
  //   print("donee");
  //   statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await loginData.postData(email.text, password.text);
  //     print("=============controller $response");
  //     statusRequest = handlingData(response);
  //     print('object');
  //     print(response);
  //     if (StatusRequest.success == statusRequest) {
  //       print('fff');
  //       if (response['message'] == "Login successful!") {
  //         String name = response['data']['name'];
  //         token = response['access_token'];
  //         print("-------------------------------");
  //         print(token);
  //         Get.offNamed(AppRoute.successSignUP);
  //       }
  //       print('no success');
  //     }
  //     update();
  //   } else {
  //     print(" not valid");
  //   }
  // }

  // @override
  // void onInit() {
  //   email = TextEditingController();
  //   password = TextEditingController();
  //   super.onInit();
  // }

  // @override
  // void dispose() {
  //   email.dispose();
  //   password.dispose();
  //   super.dispose();
  // }

  