import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/components/appbar.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';

class NRIsection extends StatefulWidget {
  NRIsection({Key? key}) : super(key: key);

  @override
  _NRIsectionState createState() => _NRIsectionState();
}

class _NRIsectionState extends State<NRIsection> {


  onback(){
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return  WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          toolbarHeight: 60.h,
          centerTitle: true,
          backgroundColor: white,
          title: Text(
            translate!.navkey4,
            style: GoogleFonts.poppins(
                color: black, fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushNamed(context, homeroute),
              icon: Image.asset(
                "assets/icons/rback.png",
                color: black,
                height: 35,
              )),
        ),
      ),
    );
  }
}
