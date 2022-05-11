import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/Legalforms_screen.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Willlegalforms extends StatefulWidget {
  Willlegalforms({Key? key}) : super(key: key);

  @override
  _WilllegalformsState createState() => _WilllegalformsState();
}

class _WilllegalformsState extends State<Willlegalforms> {
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
            // elevation: 3,
            toolbarHeight: 70,
            centerTitle: true,
            // backgroundColor: dialog,
            title: FittedBox(
              child: Text(
                translate!.forms2,
                style: titletextwhite,
                textAlign: TextAlign.center,
              ),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushNamed(context, legalformroute),
                icon: Icon(
                  Icons.arrow_back,
                  // height: 35,
                )),
          ),
          body: wills(context)),
    );
  }

  wills(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> will_legalforms = [
      Legalformsdatamodel(title: translate!.willsform1, url: ""),
      Legalformsdatamodel(title: translate.willsform2, url: ""),
      Legalformsdatamodel(title: translate.willsform3, url: ""),
      Legalformsdatamodel(title: translate.willsform4, url: ""),
      Legalformsdatamodel(title: translate.willsform5, url: ""),
      Legalformsdatamodel(title: translate.willsform6, url: ""),
      Legalformsdatamodel(title: translate.willsform7, url: ""),
      Legalformsdatamodel(title: translate.willsform8, url: ""),
      Legalformsdatamodel(title: translate.willsform9, url: ""),
      Legalformsdatamodel(title: translate.willsform10, url: ""),
      Legalformsdatamodel(title: translate.willsform11, url: ""),
      Legalformsdatamodel(title: translate.willsform12, url: ""),
      Legalformsdatamodel(title: translate.willsform13, url: ""),
    ];
    Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: will_legalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: black),
              title: Text(
                will_legalforms[index].title,
                style: demofont,
              ),
              // onTap: ()=>{launch(legalforms[index].Url)});
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: dialog,
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
