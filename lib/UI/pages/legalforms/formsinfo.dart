import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/Client/utils/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Business.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Company_laws.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Comsumer_laws.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Criminal_laws.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Deeds.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Family_laws.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Gifts.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Mortgage.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Partition.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Partnership.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Sales.dart';
import 'package:indolawassociates/UI/widgets/Legalfomrsinfopage/Trust_Agreement.dart';

class Legalinfo extends StatefulWidget {
  const Legalinfo({Key? key}) : super(key: key);

  @override
  _LegalinfoState createState() => _LegalinfoState();
}

class _LegalinfoState extends State<Legalinfo> {
  void onback() {
    Navigator.pushNamed(context, homeroute);
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
            backgroundColor: white,
            title: Text(
              translate!.legalforms,
              style: GoogleFonts.poppins(
                  color: black, fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context,homeroute),
                icon: Image.asset(
                  "assets/icons/rback.png",
                  color: black,
                  height: 35,
                )),
          ),
          body: NetworkSensitive(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms1,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Trustlegalforms())),
                    ),
                    Divider(),
                    // ListTile(
                    //   leading: Icon(Icons.logout, color: black),
                    //   title: Text(
                    //     translate.forms2,
                    //     style: demofont,
                    //   ),
                    //   onTap: () => Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Willlegalforms())),
                    // ),
                    // Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms3,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Businesslegalformsd())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms4,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Companylegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms5,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Consumerlegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms6,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Criminallegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms7,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Deedslegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms8,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Familylegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms9,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Giftslegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms10,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mortgagelegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: black,
                      ),
                      title: Text(
                        translate.forms11,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Partitionlegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms12,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Partnershiplegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout, color: black),
                      title: Text(
                        translate.forms13,
                        style: demofont,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => saleslegalforms())),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
