import 'package:ecommerce_application/core/constant/routesname.dart';
import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SplashScreenController extends GetxController {
  next();

  onPageChanged(int index);
}

class SplashScreenControllerImp extends SplashScreenController {
  @override
  next() {
    // TODO: implement next
    throw UnimplementedError();
  }

  @override
  onPageChanged(int index) {
    // TODO: implement onPageChanged
    throw UnimplementedError();
  }
}
