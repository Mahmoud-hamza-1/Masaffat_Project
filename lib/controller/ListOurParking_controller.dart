import 'dart:convert';
import 'package:ecommerce_application/controller/auth/login_controller.dart';
import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/data/datasource/remote/auth/login_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

abstract class ListOurParking_controller extends GetxController {
  getAllparking();
}

class OurParkingControllerImp extends ListOurParking_controller {
  static var token = '';
  List listOfParking = [];
  var totalPrice = 0;

  LoginData loginData = LoginData(Get.put(Crud()));

  @override
  Future<http.Response> getAllparking() async {
    print('1');

    http.Response response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/get/favorite/product'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${LoginControllerImp.token}'
        });
    print('2');
    if (response.statusCode == 200) {
      print('3');
      var map = jsonDecode(response.body);
      print('4');
      if (map['message'] == 'success fetch all favorite product') {
        print('5');
        listOfParking = map['data'];
        print('6');
      } else {
        Get.defaultDialog(title: 'oops', middleText: 'there is no products ');
      }
      print(listOfParking);
      update();
      return response;
    } else {
      throw new Exception('can not load');
    }
  }

  @override
  void onInit() {
    getAllparking();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
