import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/components/slider/sliderzoom.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/components/button.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Settingspage/profilepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';


class Offersub extends StatelessWidget {
  const Offersub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onback() {
      Navigator.pushNamed(context, settingsroute);
    }

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
          appBar: AppBar(
            elevation: 3,
            toolbarHeight: height * 0.011.h,
            centerTitle: true,
            backgroundColor: dialog,
            title: FittedBox(
              child: Text(
                translate!.drawerkey2,
                style: GoogleFonts.poppins(
                    color: white, fontWeight: FontWeight.w500, fontSize: 15.sp),
              ),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, settingsroute),
                icon: Image.asset(
                  "assets/icons/rback.png",
                  color: white,
                  height: 10.h,
                )),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Row(
                  //   children: <Widget>[
                  //     Container(
                  //       child: IconButton(
                  //           iconSize: 40.r,
                  //           color: white,
                  //           icon: Image.asset(
                  //             "assets/icons/rback.png",
                  //             color: white,
                  //             height: 40.h,
                  //           ),
                  //           onPressed: () =>
                  //               Navigator.pushNamed(context, settingsroute)),
                  //     ),
                  //     SizedBox(
                  //       width: width * 0.08.h,
                  //     ),
                  //     Expanded(
                  //       child: Text(translate.drawerkey2,
                  //           style: GoogleFonts.poppins(
                  //               fontSize: 20.5.sp,
                  //               fontWeight: FontWeight.w500,
                  //               color: white)),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height * 0.003.h,
                  // ),
                  // Container(
                  //   child: Slisder(),
                  //   height: height * 0.02.h,
                  // ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Text(
                    translate.refer,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),
                  Text(
                    translate.refersubtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
            
                  Sliderimage(),      SizedBox(
                    height: height * 0.003.h,
                  ),
                  TextButton(
                    onPressed: () {launch(
                          "https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw");
                
                      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      //     content: Text(
                      //   "Locked",
                      //   style: dfont,
                      // )));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(35),
                            color: dialog,
                            border: Border.all(color: navy)),
                        height: height * 0.009.h,
                        width: width * 0.2.w,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate.invite,
                            style: GoogleFonts.poppins(
                                color: white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        )),
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
