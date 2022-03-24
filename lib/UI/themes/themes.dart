import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
// import 'package:fustal/src/config/config.dart';

final lightmode = ThemeData(
  primaryColor: appcolor,
  fontFamily: "Poppins",
  iconTheme: IconThemeData(color: Colors.grey[900]),
  scaffoldBackgroundColor: Colors.grey.shade100,
  toggleButtonsTheme: ToggleButtonsThemeData(color: Colors.grey.shade100),
  brightness: Brightness.light,
  shadowColor: Color(0xFFFFFFFF),
  primaryColorDark: Colors.grey[800],
  primaryColorLight: Colors.white,
  secondaryHeaderColor: Colors.grey[600],
  textTheme: TextTheme(
      subtitle1: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.grey[900]),
      subtitle2: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 22, color: Colors.grey[900])),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.grey[900],
    ),
    actionsIconTheme: IconThemeData(color: Colors.grey[900]),
    titleTextStyle: GoogleFonts.poppins(
      // fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.6,
      wordSpacing: 1,
      color: Colors.grey[900],
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: appcolor,
    unselectedLabelColor: Colors.grey.shade500,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(color: appcolor),
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    backgroundColor: Colors.white,
    selectedItemColor: appcolor,
    unselectedItemColor: Colors.grey[500],
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: appcolor.withOpacity(0.7)),
);

final darkmode = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: appcolor.withOpacity(0.7)),
    primaryColor: appcolor,
    fontFamily: "Poppins",
    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: Color(0xff1F1D2A),
    primaryColorDark: Color(0xff282633),
    toggleButtonsTheme: ToggleButtonsThemeData(color: Colors.white),
    primaryColorLight: Color(0xff282633),
    secondaryHeaderColor: Color(0xff282633),
    brightness: Brightness.dark,
    shadowColor: const Color(0xff282828),
    textTheme: const TextTheme(
        subtitle1: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // color: Colors.grey[900],
      color: Color(0xff1F1D2A), elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        // fontFamily: 'Poppins',
        fontSize: 18,
        letterSpacing: -0.6,
        wordSpacing: 1,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   selectedIconTheme: IconThemeData(color: Colors.deepPurpleAccent),
    //   unselectedIconTheme: IconThemeData(color: Colors.white),
    //   backgroundColor: Colors.grey[900],
    //   selectedItemColor: Colors.deepPurpleAccent,
    //   unselectedItemColor: Colors.grey[500],
    // ),
    bottomAppBarColor: Color(0xff1F1D2A),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
    ));
