import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/components/slider/slider.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';

class NRIsection extends StatefulWidget {
  NRIsection({Key? key}) : super(key: key);

  @override
  _NRIsectionState createState() => _NRIsectionState();
}

class _NRIsectionState extends State<NRIsection> {
  onback() {
    Navigator.pushNamed(context, homeroute);
  }

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   elevation: 3,
          //   toolbarHeight: 60.h,
          //   centerTitle: true,
          //   backgroundColor: dialog,
          //   title: Text(
          //     translate!.navkey4,
          //     style: GoogleFonts.poppins(
          //         color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
          //   ),
          //   leading: IconButton(
          //       onPressed: () => Navigator.pushNamed(context, homeroute),
          //       icon: Image.asset(
          //         "assets/icons/rback.png",
          //         color: white,
          //         height: 35,
          //       )),
          // ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003.h,
                  ),
                  Container(
                    child: Slisder(),
                    height: height*0.022.h,
                    width: width * 1.w,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003.h,
                  ),
                  Text(translate!.welcomenri,textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003.h,
                  ),
                  Text(
                   translate.nripara1, textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500),textScaleFactor: 0.9,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003.h,
                  ),
                  Text(
                   translate.nripara3, textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500),textScaleFactor: 0.9,
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Text(
                  translate.nripara2,  textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500),textScaleFactor: 0.9,
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.001.h,
                  ),
                  Text(
                    translate.drawerkey5,
                    style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.bold,
                        color: black,
                        fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: height * 0.0015.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          launcher("tel: 8940383000");
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: white,
                                border: Border.all(color: navy)),
                            height: height * 0.06,
                            width: width * 0.35,
                            // padding: const EdgeInsets.symmetric(
                            //   vertical: 15.0,
                            //   horizontal: 15.0,
                            // ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/icons/call.png",
                                    color: black,
                                    height: 3.h,
                                  ),
                                  Text(
                                    translate.mobile,
                                    style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        color: black,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )),
                      ),

                      TextButton(
                        onPressed: () {
                          launcher("mailto: indolawassociates@gmail.com");
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: white,
                                border: Border.all(color: navy)),
                            height: height * 0.06,
                            width: width * 0.35,
                            // padding: const EdgeInsets.symmetric(
                            //   vertical: 15.0,
                            //   horizontal: 15.0,
                            // ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    (FontAwesomeIcons.mailBulk),
                                    color: black,
                                  ),
                                  Text(
                                    translate.mail,
                                    style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        color: black,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )),
                      ),

                      //   , CustomButton(
                      // height: height * 0.06,
                      //     text: "Email us",
                      //     width: width*0.35,
                      //     onpressed: (){},
                      //     style: GoogleFonts.poppins(
                      //   // fontWeight: FontWeight.bold,
                      //   color: black,
                      //   fontSize: 12.sp),)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
