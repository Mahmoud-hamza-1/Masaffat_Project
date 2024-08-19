

// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart ' as http;


// abstract class MyCarsController extends GetxController{
// getMyCars();



// }

// class MyCarsControllerImp extends MyCarsController {
//   String? plat_number;
//   String? description;
//   String? image;
//   String? color_vehicle_id;
//   String? vehicle_category_id;
//   String? user_id;



//   MyCarsControllerImp({
//     this.plat_number,
//     this.description,
//     this.image,
//     this.color_vehicle_id,
//     this.vehicle_category_id,
//     this.user_id,
//   });

//   MyCarsControllerImp.fromJson(Map<String, dynamic> json) {
//     avatar = json['avatar'];
//     name = json['name'];
//     date = json['date'];
//     amount = json['amount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['avatar'] = avatar;
//     data['name'] = name;
//     data['date'] = date;
//     data['amount'] = amount;
//     return data;
//   }



//   @override
//        Future<List<MyCarsControllerImp>> getMyCars() async {
//     final response = await http.get(Uri.parse(
//         'https://brotherlike-navies.000webhostapp.com/people/people.php'));

//     if (response.statusCode == 200) {
//       final List result = json.decode(response.body);
//       return result.map((e) => MyCarsControllerImp.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
  



//   }




// }




