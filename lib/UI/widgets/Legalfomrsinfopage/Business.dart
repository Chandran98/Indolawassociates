import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
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
                style: titletextwhite,
                textAlign: TextAlign.center,
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
      Legalformsdatamodel(
          title: translate!.businessform1,
          url:
              "https://drive.google.com/file/d/1ClnLTuQiqFABLgLTj7gJMmQp3p78eZjL/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform2,
          url:
              "https://drive.google.com/file/d/1bcSU0AG4qAZak8Z-u2OwQKlx6QoLmYfg/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform3,
          url:
              "https://drive.google.com/file/d/1zx6XMqi7jkCxkjsuZXNLpX7cNnidhq9S/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform4,
          url:
              "https://drive.google.com/file/d/1mWPfMpmnYGrHaQjNpse0RfJCLBCA9fcW/view?usp=sharing"),
      Legalformsdatamodel(title: translate.businessform5, url: ""),
      Legalformsdatamodel(title: translate.businessform6, url: ""),
      Legalformsdatamodel(
          title: translate.businessform7,
          url:
              "https://drive.google.com/file/d/1vo2JN0jFBkdsjrBL015e9EqN4wbnEN4O/view?usp=sharing"),
      Legalformsdatamodel(title: translate.businessform8, url: ""),
      Legalformsdatamodel(
          title: translate.businessform9,
          url:
              "https://drive.google.com/file/d/1-oTbe8lvEqemkM12FVZ4NV7y1yHu3QWQ/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform15,
          url:
              "https://drive.google.com/file/d/1pPaL_B5tJcfYpECvi7ZhUr0CUYmgzn72/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform16,
          url:
              "https://drive.google.com/file/d/15QVyC1jLOS0ZShbIXqYkUfYKG7dZvZW9/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform17,
          url:
              "https://drive.google.com/file/d/1vtmgibDLzCZG9lOehBbA8vScnY7RY5-K/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform18,
          url:
              "https://drive.google.com/file/d/1G1vQSy4TI3OSMopuwBWHwgqOPiuc2T7W/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform19,
          url:
              "https://drive.google.com/file/d/1846EeeJYYaNydtax0GovivUZb-AcRLs-/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform20,
          url:
              "https://drive.google.com/file/d/1BlsksT5TFck0UQHIxsc3WDP7yijbdGNH/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.businessform21,
          url:
              "https://drive.google.com/file/d/1BlsksT5TFck0UQHIxsc3WDP7yijbdGNH/view?usp=sharing"),
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
              // onTap: ()=>{launch(legalforms[index].url)});
              onTap: () {
                launch(businesslegalforms[index].url);
                // showDialog(
                //     context: context,
                //     builder: (context) => AlertDialog(backgroundColor: dialog,
                //           elevation: 10,
                //           content: Text(
                //             translate.helptitle,
                //             style: dfont,
                //           ),
                //           contentPadding: EdgeInsets.only(
                //               top: 20, left: 20, right: 20, bottom: 10),
                //           actions: [
                //             Padding(
                //               padding:
                //                   const EdgeInsets.symmetric(horizontal: 10),
                //               child: Row(
                //                 children: [
                //                   Icon(
                //                     Icons.phone,
                //                     color: white,
                //                   ),
                //                   FlatButton(
                //                     onPressed: () {
                //                       launcher("tel: 8940383000");
                //                     },
                //                     child: Text(
                //                       "8940383000",
                //                       style: dfont,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             )
                //           ],
                //         ));
              });
        },
      ),
    );
  }
}
