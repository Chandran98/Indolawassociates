import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>n()));
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
            // elevation: 3,
            toolbarHeight: 70,
            centerTitle: true,
            // backgroundColor: dialog,
            title: Text(
              "Notification",
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, homeroute),
                icon: const Icon(
                  Icons.arrow_back,
                  // color: Colors.white,
                )),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
