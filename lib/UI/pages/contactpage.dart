import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/profilepage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Contactpage extends StatefulWidget {
  Contactpage({Key? key}) : super(key: key);

  @override
  _ContactpageState createState() => _ContactpageState();
}

class _ContactpageState extends State<Contactpage> {
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  void onback() {Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 40.r,
                            color: white,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 40.h,
                            ),
                            onPressed: () => Navigator.pushNamed(context,settingsroute)),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 30),
                      //   child: Container(
                      //     child: IconButton(
                      //         iconSize: 40.r,
                      //         color: white,
                      //         icon: Image.asset(
                      //           "assets/icons/edit.png",
                      //           color: iconcolor,
                      //           height: 24.h,
                      //         ),
                      //         onPressed: () {}),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02.h,
                  ),
                  Text(
                    translate!.cpage,
                    style: GoogleFonts.poppins(
                        fontSize: 30.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.008.h,
                  ),
                  Text(
                    translate.helpline1,
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    translate.helplinetitle1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.03.h,
                  ),
                  InkWell(
                    onTap: () {
                      launcher("tel: 8940383000");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15),
                            color: white,
                            border: Border.all(color: Color(0xff2748A0))),
                        height: MediaQuery.of(context).size.height * 0.06.h,
                        width: MediaQuery.of(context).size.width * 0.7.h,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate.mobile,
                            style: GoogleFonts.poppins(
                                // fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 20.sp),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.03.h,
                  ),
                  InkWell(
                    onTap: () {
                      launcher("mailto: indolawassociates@gmail.com");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15),
                            color: white,
                            border: Border.all(color: Color(0xff2748A0))),
                        height: MediaQuery.of(context).size.height * 0.06.h,
                        width: MediaQuery.of(context).size.width * 0.7.h,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate.mail,
                            style: GoogleFonts.poppins(
                                // fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 20.sp),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.03.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02.h,
                  ),
                  FittedBox(
                    child: Text(
                      translate.exp,
                      style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.008.h,
                  ),
                  Text(
                    translate.helptitle,
                    style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.012.h,
                  ),
                  InkWell(
                    onTap: () {
                      launch(
                          "https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw");
                    },
                    child: Image.asset(
                      "assets/icons/star.png",
                      height: height * 0.05,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1.h,
                  ),
                  Text(
                    translate.follow,
                    style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.005.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          launch(
                              "https://www.linkedin.com/company/indo-law-associates");
                        },
                        child: Image.asset(
                          "assets/icons/likin.png",
                          height: height * 0.065,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02.w,
                      ),
                      InkWell(
                        onTap: () {
                          launcher(
                              "https://www.facebook.com/Indo-Law-Associates-112576861204879/?ref=pages_you_manage");
                        },
                        child: Image.asset(
                          "assets/icons/fb.png",
                          height: height * 0.055,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03.w,
                      ),
                      InkWell(
                        onTap: () {
                          launcher(
                              "https://www.instagram.com/indolaw_associates/");
                        },
                        child: Image.asset(
                          "assets/icons/insta.png",
                          height: height * 0.04,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw