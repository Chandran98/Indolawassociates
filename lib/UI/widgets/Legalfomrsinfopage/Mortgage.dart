import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Mortgagelegalforms extends StatefulWidget {
  Mortgagelegalforms({Key? key}) : super(key: key);

  @override
  _MortgagelegalformsState createState() => _MortgagelegalformsState();
}

class _MortgagelegalformsState extends State<Mortgagelegalforms> {
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
                translate!.forms10,
                // style: titletextwhite,
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
          body: mortgage(context)),
    );
  }

  mortgage(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> mortgageLegalforms = [
      Legalformsdatamodel(title: translate!.mortgageform1,url: "https://drive.google.com/file/d/15-wCD00FxFMWUdtgS-p6Eu0gS5OVzvkK/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform2, url: "https://drive.google.com/file/d/1TQeCP5WgfvRML8NmC-tkOj7KL2349OtO/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform3, url: "https://drive.google.com/file/d/15iwnbzriw7nzBjzUdHj3L41oaCx6_Lh9/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform4, url: "https://drive.google.com/file/d/1lCSDTwu_nzpodMGs3MMeMhJSNSS_0x2u/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform5, url: "https://drive.google.com/file/d/1f-XXlSGp32jjfg81LTHIukqeCF0uyHZ3/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform6, url: "https://drive.google.com/file/d/1r7ZxATjxlY-Sb5mL7e8YcEeR2r1CsFul/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform7, url: "https://drive.google.com/file/d/1nGeqdOJvzh7E_D0kw_tAdteyOAYM9fji/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform8, url: "https://drive.google.com/file/d/1ja5vW-wja-86GnESql1bUGxf2rhEvpbu/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform9, url: "https://drive.google.com/file/d/1sZOyH_U5ay6Ggq5GqloZBg5VsVzcKrvt/view?usp=sharing"),
      Legalformsdatamodel(title: translate.mortgageform10,url: "https://drive.google.com/file/d/1JToKSIgN1FE6_OlxKUrvyTJkd4gv9LO4/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: mortgageLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(FontAwesomeIcons.filePdf ),
              title: Text(
                mortgageLegalforms[index].title,
                // style: demofont,
              ),
              onTap: ()=>{launch(mortgageLegalforms[index].url)});
              // onTap: () {
              //   showDialog(
              //       context: context,
              //       builder: (context) => AlertDialog(
              //             backgroundColor: dialog,
              //             elevation: 10,
              //             content: Text(
              //               translate.helptitle,
              //               style: dfont,
              //             ),
              //             contentPadding: EdgeInsets.only(
              //                 top: 20, left: 20, right: 20, bottom: 10),
              //             actions: [
              //               Padding(
              //                 padding:
              //                     const EdgeInsets.symmetric(horizontal: 10),
              //                 child: Row(
              //                   children: [
              //                     Icon(
              //                       Icons.phone,
              //                       color: white,
              //                     ),
              //                     FlatButton(
              //                       onPressed: () {
              //                         launcher("tel: 8940383000");
              //                       },
              //                       child: Text(
              //                         "8940383000",
              //                         style: dfont,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               )
              //             ],
              //           ));
              // });
        },
      ),
    );
  }
}
