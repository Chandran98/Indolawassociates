import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/components/Internet%20connectivity/Network_status.dart';
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
// import 'package:sizer/sizer.dart';

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

    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: NetworkSensitive(
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              // elevation: 3,
              toolbarHeight: 60,
              centerTitle: true,
              // backgroundColor: appcolor,
              title: Text(
                translate!.legalforms,
                // style: titletextwhite,
                // textAlign: TextAlign.center,
              ),
              leading: IconButton(
                  onPressed: () => Navigator.pushNamed(context, homeroute),
                  icon: Icon(
                    Icons.arrow_back, 
                    // height: 35,
                  )),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms1,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Trustlegalforms())),
                    ),
                    Divider(),
                    // ListTile(
                    //   leading: Icon(Icons.logout, ),
                    //   title: Text(
                    //     translate.forms2,
                    //
                    //   ),
                    //   onTap: () => Navigator.pushReplacement(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => Willlegalforms())),
                    // ),
                    // Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms3,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Businesslegalformsd())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms4,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Companylegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms5,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Consumerlegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms6,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Criminallegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms7,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Deedslegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms8,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Familylegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms9,
                        //
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Giftslegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms10,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Mortgagelegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms11,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Partitionlegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms12,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Partnershiplegalforms())),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        CupertinoIcons.folder_badge_minus,
                      ),
                      title: Text(
                        translate.forms13,
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
