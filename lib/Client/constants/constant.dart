import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


const secondary = Color(0xFFFFECDF);
const gradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const headColor = Color(0xFF979797);
const TextColor = Color(0xFF757575);

const gold = Color(0xFFd09140);
const navy = Color(0xFF063554);
const white = Color(0xFFFFFFFF);
const lightblue = Color(0xffb3e5fc);
final DStyle =
    GoogleFonts.mulish(fontSize: 16.sp, color: navy, fontWeight: FontWeight.w500);

final hStyle =
    GoogleFonts.mulish(fontSize: 15.sp, color: navy, fontWeight: FontWeight.w500);
final FStyle =
    GoogleFonts.mulish(fontSize: 17.sp, color: navy, fontWeight: FontWeight.w500);
final sStyle = GoogleFonts.mulish(fontSize: 17.sp, color: navy);
final bStyle =
    GoogleFonts.mulish(fontSize: 20.sp, color: navy, fontWeight: FontWeight.bold);
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


