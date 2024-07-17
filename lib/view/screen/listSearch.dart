import 'package:ecommerce_application/controller/auth/fotgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/core/function/validinput.dart';
import 'package:ecommerce_application/view/widget/auth/custombuttonAuth.dart';
import 'package:ecommerce_application/view/widget/auth/custommainlabel.dart';
import 'package:ecommerce_application/view/widget/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/listSearchController.dart';

class ListSearch extends SearchDelegate <String> {

Widget build(BuildContext context) {

return Scaffold(
appBar: AppBar(
  title: Text('search'),
  actions: [

IconButton(icon:Icon(Icons.search),onPressed: (){

showSearch(context: context, delegate: ListSearch() );

},),


  ],
),



);

  
 }







  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
    },
     icon: Icon(Icons.clear)  
     )
     ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
    },
     icon: Icon(Icons.arrow_back)
     
     );
  }



  @override
  Widget buildResults(BuildContext context) {
   return Text("build results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
       return Text("body search");
  }


  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }







  
}
