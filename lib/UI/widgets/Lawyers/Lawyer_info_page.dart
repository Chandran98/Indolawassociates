import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Lawyerinfocard extends StatefulWidget {
  Lawyerinfocard({required this.area1,
      required this.area2,
      required this.area3,
      required this.area4,
      required this.area5,
      required this.area6,
      required this.name,
      required this.images,
      required this.specialized,
      required this.description});
  final String name,
      specialized,
      description,
      images,
      area1,
      area2,
      area3,
      area4,
      area5,
      area6;

  @override
  _LawyerinfocardState createState() => _LawyerinfocardState();
}

class _LawyerinfocardState extends State<Lawyerinfocard> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainHomepage()));
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
          // floatingActionButton: FloatingActionButton.extended(
          //     backgroundColor: black,
          //     onPressed: () {
          //       launcher("tel: 8940383000");
          //     },
          //     icon: Icon(Icons.call),
          //     label: Text(
          //       "Book Appointment",
          //       // style: dfont,
          //     )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 5.h,
                            // color: navy,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 12.h,
                            ),
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainHomepage()))),
                      ),
                      SizedBox(
                        width: width * 0.04.w,
                      ),
                      Text("Lawyer info",
                          style: GoogleFonts.poppins(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.w500,
                              color: black))
                    ],
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02.h,
                    width: MediaQuery.of(context).size.width * 1.w,
                    decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.images),
                          fit: BoxFit.contain,
                        ),
                        color: white),
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Text(
                    widget.name,
                    style: GoogleFonts.mulish(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  // SizedBox(
                  //   height: height * 0.001.h,
                  // ),
                  Text(
                    "${widget.specialized} Lawyer",
                    style: GoogleFonts.mulish(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.003.h,
                  ),
                  AutoSizeText(
                    widget.description,
                    style: GoogleFonts.poppins(
                      // fontWeight: FontWeight.w600,
                      fontSize: 10.sp,
                    ),
                    textAlign: TextAlign.justify,
                    textScaleFactor: 1,
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Pratices Area",
                      style: GoogleFonts.mulish(
                          fontSize: 12.sp,
                          color: black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Container(
                    height: height * 0.02.h,
                    child: Row(
                      children: [
                        Expanded(
                            // flex: 1,
                            child: Container(
                          // color: navy,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Titlecard(title: widget.area1),
                              Titlecard(title: widget.area2),
                              Titlecard(title: widget.area3),
                              // Titlecard(title: "title"),
                              // Titlecard(title: "title"),
                            ],
                          ),
                        )),
                        Expanded(
                            // flex: 1,
                            child: Container(
                          // color: green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Titlecard(title: widget.area4),
                              Titlecard(title: widget.area5),
                              Titlecard(title: widget.area6),
                              // Titlecard(title: "title"),
                              // Titlecard(title: "title"),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  // SizedBox(
                  //   height: height * 0.003.h,
                  // ),
                  Text(
                    translate!.drawerkey5,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.bold,
                        color: black,
                        fontSize: 13.sp),
                  ),
                  // SizedBox(
                  //   height: height * 0.003.h,
                  // ),
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
                                    height: 3.5.h,
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

class Titlecard extends StatelessWidget {
  Titlecard({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check, color: gold),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.003.w,
        ),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.mulish(
                fontWeight: FontWeight.w600, fontSize: 10.sp, color: black),
          ),
        ),
      ],
    );
  }
}
