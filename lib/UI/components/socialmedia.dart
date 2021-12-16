import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Socialmedia extends StatelessWidget {
  const Socialmedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(children: [ Text(
                "Follow us on",
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
                    onTap: () {launch("https://www.linkedin.com/company/indo-law-associates");},
                    child: Image.asset(
                      "assets/icons/likin.png",
                      height: height * 0.065,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02.w,
                  ),
                  InkWell(
                    onTap: () {launch("https://www.facebook.com/Indo-Law-Associates-112576861204879/?ref=pages_you_manage");},
                    child: Image.asset(
                      "assets/icons/fb.png",
                      height: height * 0.055,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03.w,
                  ),
                  InkWell(
                    onTap: () {launch("https://www.instagram.com/indolaw_associates/");},
                    child: Image.asset(
                      "assets/icons/insta.png",
                      height: height * 0.04,
                    ),
                  ),
                ],
              )
          ],),
    );
  }
}