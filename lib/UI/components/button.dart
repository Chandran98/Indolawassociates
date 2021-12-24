import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.height,
      required this.text,
      required this.width,
      required this.onpressed,required this.style});
  final String text;
  TextStyle style;
  double height;
  double width;
  VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: white,
              border: Border.all(color: navy)),
          height: height,
          width: width,
          // padding: const EdgeInsets.symmetric(
          //   vertical: 15.0,
          //   horizontal: 15.0,
          // ),
          child: Center(
            child: Flexible(
              child: Text(
                text,
                style:style,
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
