import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';


class CustomAppbar extends StatelessWidget {
final String title;
final TextStyle style;
Widget navipage;

CustomAppbar({required this.title,required this.navipage,required this.style});
  @override
  Widget build(BuildContext context) {
    return     Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        child: IconButton(
                            iconSize: 40,
                            color: white,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 40.h,
                            ),
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>navipage))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: Expanded(
                        child: Text(
                          title,
                          style: style
                        ),
                      ),
                    )
                  ],
                );
  }
}