import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  CustomButtonAuth({
    super.key,
    required this.text,
    required this.onPressed,
    this.Radiuss = 50,
    this.height = 30,
    this.minWidth = double.infinity,
  });
  final String text;
  Color botderColor = Colors.black;
  Color bodyColor = Colors.greenAccent;
  double Radiuss;
  double minWidth;
  double height;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        duration: Duration(milliseconds: 1400),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            padding: EdgeInsets.only(top: 3, left: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Radiuss),
                border: Border(
                  bottom: BorderSide(color: botderColor),
                  top: BorderSide(color: botderColor),
                  left: BorderSide(color: botderColor),
                  right: BorderSide(color: botderColor),
                )),
            child: MaterialButton(
              minWidth: minWidth,
              height: height,
              onPressed: onPressed,
              color: bodyColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Radiuss)),
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
            ),
          ),
        ));
  }
}
