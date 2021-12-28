import 'package:flutter/material.dart';


class SizeConfig{
 static MediaQueryData? _mediaQueryData;
 static  double? screenWidth;
 static  double? screenHeight;
 static double? defaultSize;


void init(context){
  _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData?.size.width;
  screenHeight=_mediaQueryData?.size.height;
  }

double getheight(inputheight){
 double? screenHeight=SizeConfig.screenHeight;
  return (inputheight/812.0)*screenHeight;
}
double getwidth(inputwidth){
 double? screenWidth=SizeConfig.screenWidth;
  return (inputwidth/375.0)*screenWidth;
}
}