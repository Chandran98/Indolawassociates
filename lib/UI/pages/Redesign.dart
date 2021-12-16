import 'dart:ui';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/components/slider/slider.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/Client/provider/languageprovider.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/components/clippath.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_list.dart';
import 'package:provider/src/provider.dart';
import '../widgets/categories/Category_list_page.dart';

class CloneHOME extends StatefulWidget {
  CloneHOME({Key? key}) : super(key: key);

  @override
  _CloneHOME createState() => _CloneHOME();
}

class _CloneHOME extends State<CloneHOME> {
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    List language = [translate!.language1, translate.primarylanguage];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return NetworkSensitive(
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
              label: Text(
                translate.quickcall,
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.call,
                size: 20.r,
                color: Colors.white,
              ),
              backgroundColor: black,
              onPressed: () {}),
          // bottomNavigationBar: Bottombar(),
          backgroundColor: Color(0xffF5F5F5),
          // backgroundColor: white,
          // bottomNavigationBar: Navbar(),
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              backgroundColor: black,
              content: Text(
                'Tap back again to exit app.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            child: SingleChildScrollView(
              child:
                  // Stack(children: [
                  Column(
                children: [
                  ClipPath(
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    clipper: CustomdClipper(),
                    child: Container(
                      height: height * 0.33.h,
                      width: width * 1.w,
                      decoration: new BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.0, 1.0), //(x,y)
                        //     blurRadius: 6.0,
                        //   )
                        // ],
                        color: white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.01.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/ILALOGO.png",
                                    height: height * 0.04.h,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            languagebutton();
                                          },
                                          icon: Image.asset(
                                              "assets/icons/lang.png")),
                                      SizedBox(
                                        width: width * 0.02.w,
                                      ),
                                      IconButton(
                                          onPressed: () => Navigator.pushNamed(
                                              context, notificationroute),
                                          icon: SvgPicture.asset(
                                              "assets/icons/notification.svg")),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.008.h,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                height: height * 0.07.h,
                                width: width * 0.6.w,
                                child: DefaultTextStyle(
                                  style: GoogleFonts.poppins(
                                      fontSize: 18.sp, color: black),
                                  child: AnimatedTextKit(
                                      pause: Duration(seconds: 1),
                                      repeatForever: true,
                                      animatedTexts: [
                                        FadeAnimatedText(
                                          "HI Richie",
                                        ),
                                        FadeAnimatedText(translate.welcome),
                                        FadeAnimatedText(translate.hometitle),
                                      ]),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: height * 0.00.h,
                            // ),
                            Center(
                                child: Text(
                              translate.hometitle2,
                              style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                            // SizedBox(
                            //   height: height * 0.001,
                            // ),
                            Cateslider()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Slisder(),
                        height: height * 0.17.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          translate.hometitle3,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Relawyerlist(),
                      ),
                    ],
                  ),

                  //  Expanded(
                  // flex: 1,
                  // child:Democard()),
                  // Expanded(
                ],
              ),
              // ]),
            ),
          ),
        ),
      ),
    );
  }

  languagebutton() {
    final translate = AppLocalizations.of(context);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                translate!.languagekey,
                style: hStyle,
              ),
              actionsPadding: EdgeInsets.symmetric(horizontal: 30.w),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("en");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.primarylanguage,
                      style: hStyle,
                    )),
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("ta");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.language1,
                      style: hStyle,
                    ))
              ],
            ));
  }
}
