import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/middleware/my_middleware.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:ecommerce_application/view/screen/auth/login.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommerce_application/view/screen/auth/signup.dart';
import 'package:ecommerce_application/view/screen/auth/success_%20signup.dart';
import 'package:ecommerce_application/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommerce_application/view/screen/auth/veriftycodesignup.dart';
import 'package:ecommerce_application/view/screen/language.dart';
import 'package:ecommerce_application/view/screen/onboarding.dart';
import 'package:ecommerce_application/view/screen/splash_screen.dart';
import 'package:get/get.dart';





List<GetPage<dynamic>>? routes = [
  GetPage(name:"/", page:()=> const Language(), middlewares: [MyMiddleWare(),]),
   GetPage(name:AppRoute.splash, page:()=> const SplashScreen()),
  GetPage(name:AppRoute.login, page:()=> const Login()),
  GetPage(name:AppRoute.signUp, page:()=> const SignUp()),
  GetPage(name:AppRoute.forgetPassword, page:()=> const ForgetPassword()),
  GetPage(name:AppRoute.verifyCode, page:()=> const VerifyCode()),
  GetPage(name:AppRoute.resetPassword, page:()=> const ResetPassword()),
  GetPage(name:AppRoute.successResetPassword, page:()=> const SuccessResatPassword()),
  GetPage(name:AppRoute.successSignUP, page:()=> const SuccessSignUp()),
  GetPage(name:AppRoute.verifyCodeSignUp, page:()=> const VerifyCodeSignUp()),
  GetPage(name:AppRoute.onboarding, page:()=> const OnBoarding()),
];
