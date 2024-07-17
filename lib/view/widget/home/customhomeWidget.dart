import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:flutter/material.dart';

class Customhomewidget extends StatelessWidget {
  Customhomewidget({
    super.key,
    required this.label,
    required this.path,
    required this.onPressed,
  });
  String label;
  String path;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                path,
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
