import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/localization/changelocal.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/translation.dart';
import 'routes.dart';
import 'test.dart';
import 'view/screen/OurParkingList.dart';
import 'view/screen/language.dart';
import 'view/screen/listSearch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home: Login(),
      // home: const Test(),
      //routes: routes,

      initialRoute: AppRoute.splash,
      getPages: routes,
    );
  }
}
