import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Servicepage/NRI.dart';
import 'package:indolawassociates/UI/pages/Servicepage/Paralegal/paralegal.dart';
import 'package:indolawassociates/UI/pages/Servicepage/otherservices/otherservicespage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class Servicesall extends StatefulWidget {
  Servicesall({Key? key}) : super(key: key);

  @override
  _ServiceallsState createState() => _ServiceallsState();
}

class _ServiceallsState extends State<Servicesall>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  void onback() {
    Navigator.pushNamed(context, homeroute);
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return WillPopScope(
        onWillPop: () {
          onback();
          return Future.value(false);
        },
        child: NetworkSensitive(
          child: DefaultTabController(
            length: 3,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: white,
                appBar: AppBar(
                  elevation: 3,
                  toolbarHeight: 6.h,
                  centerTitle: true,
                  backgroundColor: dialog,
                  title: Text(
                    translate!.navkey2,
                    style: GoogleFonts.poppins(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                  leading: IconButton(
                      onPressed: () => Navigator.pushNamed(context, homeroute),
                      icon: Image.asset(
                        "assets/icons/rback.png",
                        color: white,
                        height: 5.h,
                      )),
                  bottom: TabBar(
                    controller: _controller,
                    indicatorColor: white,
                    indicatorWeight: 5,
                    unselectedLabelColor: white,
                    automaticIndicatorColorAdjustment: true,
                    tabs: [
                      Tab(
                        text: translate.paralegalservices,
                        icon: Icon(CupertinoIcons.list_bullet),
                      ),
                      Tab(
                        text: translate.drawerkey3,
                        icon: Icon(CupertinoIcons.shield_lefthalf_fill),
                      ),
                      Tab(
                        text: translate.navkey4,
                        icon: Icon(CupertinoIcons.person_3_fill),
                      )
                    ],
                  ),
                ),
                body: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    children: [
                      TParalegal(),
                      OtherServicesformre(),
                      NRIsection()
                    ]),
              ),
            ),
          ),
        ));
  }
}
