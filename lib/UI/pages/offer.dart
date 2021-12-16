import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/profilepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/routes/route.dart';

class Offersub extends StatelessWidget {
  const Offersub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onback(){
      Navigator.of(context).pop();
    }
    
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);
    return  WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child:SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                Row(
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
                    ), SizedBox(
                  width: width * 0.08.h,
                ),
                    Expanded(
                      child: Text(translate!.drawerkey2,
                          style: GoogleFonts.poppins(
                              fontSize: 20.5.sp,
                              fontWeight: FontWeight.w500,
                              color: black)),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.03.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
