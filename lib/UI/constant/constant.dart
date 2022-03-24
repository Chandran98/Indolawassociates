import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/Home_page.dart';
import '../pages/Servicepage/services.dart';
import '../pages/Settingspage/settings_page.dart';
import '../pages/legalforms/legalforms_page.dart';

const iconcolor = Color(0xff333333);
const divcolor = Color(0xffADADAD);
const black = Colors.black;
final demofont = GoogleFonts.poppins(
    color: black, fontSize: 15, fontWeight: FontWeight.w500);

// final titletext = GoogleFonts.poppins(
//     color: black, fontSize: 18, fontWeight: FontWeight.w500);
final titletextwhite = GoogleFonts.poppins(
    color: white, fontWeight: FontWeight.w400, fontSize: 20);
final titletextblack = GoogleFonts.poppins(
    color: blackish, fontWeight: FontWeight.w500, fontSize: 20);
final dfont = GoogleFonts.poppins(
    color: white, fontSize: 15, fontWeight: FontWeight.w500);

const green = Color(0xff6729FE);
const blackish = Color(0xff2A2A2A);
const white = Colors.white;

const background = Color(0xff2F2F2F);
const dialog = Color(0xff332941);

const spaced10 = SizedBox(height: 10);
const spaced20 = SizedBox(height: 20);
const spaced30 = SizedBox(height: 30);

const gold = Color(0xFFd09140);
const navy = Color(0xFF063554);

///Api key ////
const mapapikey = "AIzaSyDGV9815Fr9adW2RjXxSv9TJRZ4ytusj6o";

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String usernamenull = "*Please Enter your Name";
const String emailnull = "*Please Enter your email";
const String invalidemail = "*Please Enter Valid Email";
const String passwordnull = "*Please Enter your password";
const String passwordshort = "*Password is too short";
const String passworderror = "*Passwords don't match";
const String addressnull = "*Please Enter your Location";
const String phonenull = "Please Enter your phone number";
const String phonenummin = "*Require 10 digit number";
const String loginphonenum = "*Require 10 digit number ";
const String phonenummax = "Require 10 digit number";
const String employeeid = "Require Employee ID";
const String specialization = "Require Specialization";
const String preferedarea = "Require Prefered area";
const String experience = "Require Experience";
const String experiencenull = "Check your field";

const String DOB = "Require Date of Birth";
const String otpnull = "Enter OTP";
const String otpnlength = "Enter six digit OTP";
const List<Widget> pages = [
  Homepagescreen(),
  Servicesall(),
  Legalinfo(),
  Settingscreen()
];

const Color appcolor = Color(0xff6E5ADF);
//4DD57E
//9b6
// const Color white = Colors.white;
const Color pink = Color(0xffEA4C89);
const Color appcolor2 = Color(0xffEBAE34);
// const Color black = Colors.black;

const spacedwidth10 = SizedBox(width: 10);
const spacedwidth20 = SizedBox(width: 20);
const spacedwidth30 = SizedBox(width: 30);

const Color lawcolor =Color(0xff213442);
const appimage="assets/images/civil_cate.jpg";
