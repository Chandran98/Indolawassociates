import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:indolawassociates/UI/routes/route.dart';

class Notificationpage extends StatefulWidget {
  Notificationpage({Key? key}) : super(key: key);

  @override
  _NotificationpageState createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  onback() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
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
            toolbarHeight: 60.h,
            centerTitle: true,
            backgroundColor: black,
            title: Text(
              "Notification",
              style: GoogleFonts.poppins(
                  color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, homeroute),
                icon: Image.asset(
                  "assets/icons/rback.png",
                  color: white,
                  height: 35,
                )),
          ),
        ),
      ),
    );
  }
}
