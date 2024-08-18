import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_application/controller/login2Controller.dart';
import 'package:ecommerce_application/view/widget/auth/customtextform.dart';

import '../../../core/function/validinput.dart';
import 'signup2.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Login2ControllerImp controller = Get.put(Login2ControllerImp());

    //not sure about it
    // var _keyValidationForm = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Form(
                    key: controller.formState,
                    child: Column(
                      children: <Widget>[
                        FadeInUp(
                            duration: const Duration(milliseconds: 1000),
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeInUp(
                            duration: const Duration(milliseconds: 1200),
                            child: Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 35,
                        ),
                        CustomTextForm(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 5, 50, "email");
                          },
                          hintText: '6'.tr,
                          labelText: '5'.tr,
                          iconData: Icons.email_outlined,
                          controller: controller.email,
                          focusnode: controller.emailFocus,
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // CustomTextForm(
                        //   isNumber: false,
                        //   controller: controller.password,
                        //   hintText: '8'.tr,
                        //   labelText: '7'.tr,
                        //   iconData: Icons.lock_outlined,
                        //   valid: (val) {
                        //     return validInput(val!, 8, 16, "password");
                        //   },
                        // ),

                        GetBuilder<Login2ControllerImp>(
                          builder: (controller) => CustomTextForm(
                            obscureText: controller.isShow,
                            onTapIcon: () {
                              controller.showPassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 8, 16, "password");
                            },
                            hintText: '8'.tr,
                            labelText: '7'.tr,
                            iconData: Icons.lock_outlined,
                            controller: controller.password,
                            focusnode: controller.passFocus,
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        // FadeInUp(duration: Duration(milliseconds: 1200), child: makeInput(label: "Email")),
                        // FadeInUp(duration: Duration(milliseconds: 1300), child: makeInput(label: "Password", obscureText: true)),
                      ],
                    ),
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1400),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            controller.login();
                            //Get.to(HomePage());
                          },
                          color: Colors.greenAccent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      )),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.to(SignupPage());
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ),
                          // Text("Sign up", style: TextStyle(
                          //   fontWeight: FontWeight.w600, fontSize: 18
                          // ),),
                        ],
                      ))
                ],
              ),
            ),
            FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover)),
                ))
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
