import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/SplashScreenController.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.offAllNamed(AppRoute.onboarding);
    }));
    return 
         FittedBox(
      child: Image.asset('assets/images/logocar2.png'),
      fit: BoxFit.fill,
    );

        //     Container(
        //   width: 400,
        //   height: 900,
        //   decoration: BoxDecoration(

        //     image: DecorationImage(

        //       image:
        //       AssetImage('assets/images/OIP.png'),
        //     ),
        //   ),
        //   child: Center(
        //     child: Container(
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage('assets/icons/carlogo.jpg'),
        //           scale: 2,
        //         ),
        //       ),
        //     ),
        //   ),
        // )

       // );
  }
}
