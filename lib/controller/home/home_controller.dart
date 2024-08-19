import 'dart:convert';

import 'package:ecommerce_application/data/datasource/remote/home/home_data.dart';
import 'package:ecommerce_application/data/datasource/remote/parking_map/parking_data.dart';
import 'package:ecommerce_application/data/model/home_model.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

abstract class HomeController extends GetxController {
  Future<List<AdvertModel>?> getAds();
}

class HomeControllerImp extends HomeController {
  List<AdvertModel> ads = const [];
  final homeData = const HomeData();
  String svgPath = '';
  @override
  Future<void> onInit() async {
    await getAds();
    final user = jsonDecode(sharedStorage.getString('user') ?? '');
    final response =
        await get(Uri.parse('$baseUrl1/api/latestBooking/${user['id']}'));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['qr_code'] != null) {
      svgPath = data['qr_code'] as String;
      update();
    }
    super.onInit();
  }

  @override
  Future<List<AdvertModel>?> getAds() async {
    ads = await homeData.getAds() ?? const [];
    print(ads);
    update();
    return ads;
  }
}
