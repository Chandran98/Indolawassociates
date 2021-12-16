import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Lawyerinfocard extends StatefulWidget {
  Lawyerinfocard(
      {required this.name,
      required this.images,
      required this.specialized,
      required this.description});
  final String name, specialized, description, images;

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
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: black,
              onPressed: () {
                launcher("tel: 04443511235");
              },
              icon: Icon(Icons.call),
              label: Text(
                "Book Appointment",
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          onPressed: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainHomepage()))),
                    ),
                    SizedBox(
                      width: width * 0.08.w,
                    ),
                    Text("Lawyer info",
                        style: GoogleFonts.poppins(
                            fontSize: 20.5.sp,
                            fontWeight: FontWeight.w500,
                            color: black))
                  ],
                ),
                SizedBox(
                  height: height * 0.03.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2.h,
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
                  height: height * 0.05.h,
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.mulish(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.005.h,
                ),
                Text(
                  "${widget.specialized} Lawyer",
                  style: GoogleFonts.mulish(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03.h,
                ),
                Text(
                  widget.description,
                  style: GoogleFonts.poppins(
                    // fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                  textAlign: TextAlign.justify,
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}