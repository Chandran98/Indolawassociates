import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/components/slider/slider.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/Client/provider/languageprovider.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/components/clippath.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/services/fireabase_service.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_list.dart';
import 'package:provider/src/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/categories/Category_list_page.dart';

class CloneHOME extends StatefulWidget {
  CloneHOME({Key? key}) : super(key: key);

  @override
  _CloneHOME createState() => _CloneHOME();
}

class _CloneHOME extends State<CloneHOME> {
  @override
  void initState() {
    super.initState();
    getusername();
  }

  GetdataFB getdataFB = GetdataFB();
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  String _username = "";
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
                size: 20,
                color: Colors.white,
              ),
              backgroundColor: black,
              onPressed: () {
                launcher("tel: 8940383000");
              }),
          // bottomNavigationBar: Bottombar(),
          backgroundColor: gradsoj,
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
                    //   // clipBehavior: Clip.antiAliasWithSaveLayer,
                    clipper: CustomdClipper(),
                    child:
                     Container(
                      height: height * 0.05.h,
                      width: width * 1.w,
                      decoration: new BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0.0, 1.0), //(x,y)
                        //     blurRadius: 6.0,
                        //   )
                        // ],
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            stops: [0.1, 0.9],
                            colors: [green.withOpacity(.8), Colors.black]),
                      ),
                      // gradient: new LinearGradient(
                      //     colors: [
                      //   // green,
                      //   // green,
                      //   green,
                      //   Colors.white,
                      // ],
                      //     stops: [
                      //   0.0,
                      //   1.0
                      // ],
                      //     begin: FractionalOffset.centerRight,
                      //     end: FractionalOffset.centerLeft,
                      //     tileMode: TileMode.repeated)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height * 0.001.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Hi $_username",
                                      style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  // Image.asset(
                                  //   "assets/images/ILALOGO.png",
                                  //   height: height * 0.04.h,
                                  // ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            languagebutton();
                                          },
                                          icon: Image.asset(
                                            "assets/icons/lang.png",
                                            color: white,
                                          )),
                                      SizedBox(
                                        width: width * 0.002.w,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, notificationroute);
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Testing()));
                                          },

                                          // => Navigator.pushNamed(
                                          //     context, notificationroute),
                                          icon: SvgPicture.asset(
                                            "assets/icons/notification.svg",
                                            color: white,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * 0.001.h,
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                  height: height * 0.008.h,
                                  width: width * 0.15.w,
                                  child: Text(
                                    translate.hometitle,
                                    style: GoogleFonts.poppins(
                                        fontSize: 13.sp, color: white),
                                  )

                                  // DefaultTextStyle(
                                  //   style: GoogleFonts.poppins(
                                  //       fontSize: 18.sp, color: white),
                                  //   child: AnimatedTextKit(
                                  //       pause: Duration(seconds: 1),
                                  //       repeatForever: true,
                                  //       animatedTexts: [
                                  //         FadeAnimatedText(
                                  //           "Hi ${_username}",
                                  //         ),
                                  //         FadeAnimatedText(translate.welcome),
                                  //         FadeAnimatedText(translate.hometitle),
                                  //       ]),
                                  // ),
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
                                color: Colors.white,
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
                  // ,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Slisder(),
                        height: height * 0.022.h,
                        width: width * 1.w,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 28.0, vertical: 10),
                        child: Text(
                          translate.hometitle3,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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

    showCupertinoDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: dialog,
              title: Text(
                translate!.languagekey,
                style: dfont,
              ),
              // actionsPadding: EdgeInsets.symmetric(horizontal: 1.w),
              actions: [
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("en");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.primarylanguage,
                      style: dfont,
                    )),
                TextButton(
                    onPressed: () {
                      context.read<Languagenotifier>().changelanguage("ta");
                      Navigator.pop(context);
                    },
                    child: Text(
                      translate.language1,
                      style: dfont,
                    ))
              ],
            ));
  }

  getusername() {
    return FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (mounted)
        setState(() {
          _username = value.data()!["name"].toString();
        });
    });
  }
}
