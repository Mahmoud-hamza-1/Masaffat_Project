import 'dart:convert';

import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/localization/changelocal.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/view/screen/addingCar.dart';
import 'package:ecommerce_application/view/screen/login2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/localization/translation.dart';
import 'routes.dart';
import 'view/screen/homepage.dart';
import 'view/screen/qrReader.dart';

late SharedPreferences sharedStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedStorage = await SharedPreferences.getInstance();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home: QRScanner(),
      // home: const Test(),
      //routes: routes,

      initialRoute: sharedStorage.getString('user') == null
          ? AppRoute.splash
          // : jsonDecode(sharedStorage.getString('user')!)['role'] == 'employee'
          //     ? AppRoute.login
          : AppRoute.home,
      getPages: routes,
    );
  }
}
