import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/components/socialmedia.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Settingspage/profilepage.dart';
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

  void onback() {
    Navigator.of(context).pop();
  }

  var whatsapp = "+91 8940383000";

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
                            iconSize: 20,
                            color: white,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 20.h,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, settingsroute)),
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
                    height: height * 0.002.h,
                  ),
                  Text(
                    translate!.cpage,
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),
                  Text(
                    translate.helpline1,
                    // textAlign: TextAlign.center,
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
                    height: height * 0.003.h,
                  ),
                  InkWell(
                    onTap: () async => await launch(
                        "https://wa.me/$whatsapp?text= Hi, I have an emergency"),
                    child: Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(15),
                            color: white,
                            border: Border.all(color: Color(0xff2748A0))),
                        height: MediaQuery.of(context).size.height * 0.01.h,
                        width: MediaQuery.of(context).size.width * 0.2.w,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                translate.whatsapp,
                                style: GoogleFonts.poppins(
                                    // fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 15.sp),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.0023.h,
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
                        height: MediaQuery.of(context).size.height * 0.01.h,
                        width: MediaQuery.of(context).size.width * 0.2.w,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [ Icon(Icons.phone,size: 09.w,),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                translate.mobile,
                                style: GoogleFonts.poppins(
                                    // fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 15.sp),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
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
                        height: MediaQuery.of(context).size.height * 0.01.h,
                        width: MediaQuery.of(context).size.width * 0.2.w,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Row(                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [FaIcon(
                                FontAwesomeIcons.mailBulk,
                                color: Color.fromARGB(255, 175, 116, 76),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                translate.mail,
                                style: GoogleFonts.poppins(
                                    // fontWeight: FontWeight.bold,
                                    color: black,
                                    fontSize: 15.sp),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),
                  FittedBox(
                    child: Text(
                      translate.exp,
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),
                  Text(
                    translate.helptitle,
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.001.h,
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
                    height: height * 0.0035.h,
                  ),
                  Socialmedia()
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