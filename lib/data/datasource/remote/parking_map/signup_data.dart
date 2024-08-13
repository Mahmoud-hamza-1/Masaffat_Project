import 'package:ecommerce_application/core/class/crud.dart';
import 'package:ecommerce_application/link_api.dart';

class SignUpData {
 Crud crud;
  SignUpData(this.crud);

    postData(String username,String password,String email ) async {
    var response = await crud.postData(AppLink.signupApi, {
      "name": username,
      "password":password ,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
