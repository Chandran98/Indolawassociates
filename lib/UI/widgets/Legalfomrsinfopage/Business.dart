import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Businesslegalformsd extends StatefulWidget {
  Businesslegalformsd({Key? key}) : super(key: key);

  @override
  _BusinesslegalformsdState createState() => _BusinesslegalformsdState();
}

class _BusinesslegalformsdState extends State<Businesslegalformsd> {
  void onback() {
    Navigator.pushNamed(context, legalformroute);
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
    final translate = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 3,
              toolbarHeight: 70,
            centerTitle: true,
            backgroundColor: dialog,
            title: FittedBox(
              child: Text(
                translate!.forms3,
                style: titletextwhite,textAlign: TextAlign.center,
              ),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, legalformroute),
                icon: Image.asset(
                  "assets/icons/rback.png",
                  color: white,
                  height: 35,
                )),
          ),
          body: opbuild(context)
          //  Padding(
          //   padding: const EdgeInsets.only(top:12.0,bottom: 12),
          //   child: ListView.separated(
          //     physics: BouncingScrollPhysics(),
          //     separatorBuilder: (context, index) {
          //       return Divider();
          //     },
          //     itemCount: businesslegalforms.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //           leading: Icon(Icons.remove_red_eye, color: navy),
          //           title: Text(
          //             businesslegalforms[index].title,
          //             style: hStyle,
          //           ),
          //           // onTap: ()=>{launch(legalforms[index].Url)});
          //           onTap: () {       showDialog(
          //                 context: context,
          //                 builder: (context) => AlertDialog(
          //                       elevation: 10,
          //                       content: Text(
          //                        translate!.helptitle, style: hStyle,
          //                       ),
          //                       contentPadding: EdgeInsets.only(
          //                           top: 20, left: 20, right: 20, bottom: 10),
          //                       actions: [
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 10),
          //                           child: Row(
          //                             children: [
          //                               Icon(
          //                                 Icons.phone,
          //                                 color: navy,
          //                               ),
          //                               FlatButton(
          //                                 onPressed: () {
          //                                   launcher("tel: 8940383000");
          //                                 },
          //                                 child: Text(
          //                                   "8940383000",
          //                                   style: hStyle,
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ));
          //      }
          //           );
          //     },
          //   ),
          // ),

          ),
    );
  }

  Widget opbuild(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> businesslegalforms = [
      Legalformsdatamodel(title: translate!.businessform1, Url: ""),
      Legalformsdatamodel(title: translate.businessform2, Url: ""),
      Legalformsdatamodel(title: translate.businessform3, Url: ""),
      Legalformsdatamodel(title: translate.businessform4, Url: ""),
      Legalformsdatamodel(title: translate.businessform5, Url: ""),
      Legalformsdatamodel(title: translate.businessform6, Url: ""),
      Legalformsdatamodel(title: translate.businessform7, Url: ""),
      Legalformsdatamodel(title: translate.businessform8, Url: ""),
      Legalformsdatamodel(title: translate.businessform9, Url: ""),
      Legalformsdatamodel(title: translate.businessform9, Url: ""),
      Legalformsdatamodel(title: translate.businessform10, Url: ""),
      Legalformsdatamodel(title: translate.businessform11, Url: ""),
      Legalformsdatamodel(title: translate.businessform12, Url: ""),
      Legalformsdatamodel(title: translate.businessform13, Url: ""),
      Legalformsdatamodel(title: translate.businessform14, Url: ""),
      Legalformsdatamodel(title: translate.businessform15, Url: ""),
      Legalformsdatamodel(title: translate.businessform16, Url: ""),
      Legalformsdatamodel(title: translate.businessform17, Url: ""),
      Legalformsdatamodel(title: translate.businessform18, Url: ""),
      Legalformsdatamodel(title: translate.businessform19, Url: ""),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: businesslegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: black),
              title: Text(
                businesslegalforms[index].title,
                style: demofont,
              ),
              // onTap: ()=>{launch(legalforms[index].Url)});
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(backgroundColor: dialog,
                          elevation: 10,
                          content: Text(
                            translate.helptitle,
                            style: dfont,
                          ),
                          contentPadding: EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          actions: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: white,
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      launcher("tel: 8940383000");
                                    },
                                    child: Text(
                                      "8940383000",
                                      style: dfont,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
              });
        },
      ),
    );
  }
}
