import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_application/controller/signup2Controller.dart';
import 'package:ecommerce_application/core/function/validinput.dart';
import 'package:ecommerce_application/view/screen/auth/login2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/customtextform.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignUp2ControllerImp controller = Get.put(SignUp2ControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
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
                          "Sign up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                        duration: const Duration(milliseconds: 1200),
                        child: Text(
                          "Create an account, It's free",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  //here first line
                  //  FadeInUp(duration: Duration(milliseconds: 1100), child: makeInput(label: "User Name")),

                  // FadeInUp(duration: Duration(milliseconds: 1200), child: makeInput(label: "Email")),
                  // FadeInUp(duration: Duration(milliseconds: 1300), child: makeInput(label: "Password", obscureText: true)),
                  // FadeInUp(duration: Duration(milliseconds: 1400), child: makeInput(label: "Confirm Password", obscureText: true)),

                  CustomTextForm(
                    isNumber: false,
                    controller: controller.username,
                    hintText: '14'.tr,
                    labelText: '15'.tr,
                    iconData: Icons.person_outlined,
                    focusnode: controller.usernameFocus,
                    valid: (val) {
                      return validInput(val!, 5, 50, "username");
                    },
                  ),

                  const SizedBox(
                    height: 13,
                  ),

                  CustomTextForm(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 50, "email");
                      },
                      controller: controller.email,
                      hintText: '6'.tr,
                      labelText: '5'.tr,
                      focusnode: controller.emailFocus,
                      iconData: Icons.email_outlined),

                  const SizedBox(
                    height: 13,
                  ),

                  CustomTextForm(
                    isNumber: false,
                    controller: controller.password,
                    hintText: '8'.tr,
                    labelText: '7'.tr,
                    iconData: Icons.lock_outlined,
                    focusnode: controller.passFocus,
                    valid: (val) {
                      return validInput(val!, 8, 16, "password");
                    },
                  ),
                ],
              ),
              FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        controller.signup();
                      },
                      color: Colors.red,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  )),
              FadeInUp(
                  duration: const Duration(milliseconds: 1600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already have an account?"),

                      TextButton(
                        onPressed: () {
                          Get.to(LoginPage());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),

                      // Text(
                      //   " Login",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w600, fontSize: 18),
                      // ),
                    ],
                  )),
            ],
          ),
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
