import 'dart:convert';

import 'package:ecommerce_application/data/model/home_model.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeData {
  const HomeData();

  Future<List<AdvertModel>?> getAds() async {
    try {
      var response = await get(
        Uri.parse(AppLink.advert),
        headers: <String, String>{
          'Accept': 'application/json',
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        final responseBody =
            jsonDecode(response.body)["Adverts"] as List<dynamic>;
        return responseBody.map((e) => AdvertModel.fromJson(e)).toList();
      } else {
        Get.defaultDialog(
          title: 'serverFailure',
          middleText: jsonDecode(response.body)["message"],
        );
        // return right('${jsonDecode(response.body)["msg"]}');
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'serverException',
        middleText: '$e',
      );
      // return right('$e');
    }
    return null;
  }
}
