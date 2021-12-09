import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/components/slider/slider.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/cataecard.dart';

import 'components/copy/model1.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return SafeArea(
      child: Scaffold(backgroundColor: Color(0xffefefef),
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Card(color: white,shadowColor: Color(0xffefefef),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(
                              MediaQuery.of(context).size.width, 40.0),
                          bottomRight: Radius.elliptical(
                              MediaQuery.of(context).size.width, 40.0))),
                  child: Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 30.0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 40),
                          child: Text(
                            "Hi Richie\nWelcome to India's \nFinest Advocate Platform",
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.black,
                            ),
                            textScaleFactor: 1.2,
                          ),
                        ),SizedBox(height: 5.h,),
                        Center(child: Text("Categories",style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              color: Colors.black,
                              // fontWeight: FontWeight.w600,
                            ),)),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(color: Color(0xffefefef),height: 100,width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: Cateslider()
                      ),
                    ],
                  ),
                )),
                //  Expanded(
                // flex: 1,
                // child:Democard()),
            // Expanded(
          ],
        ),
      ),
    );
  }
}
