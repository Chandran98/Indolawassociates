import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Consumerlegalforms extends StatefulWidget {
  Consumerlegalforms({Key? key}) : super(key: key);

  @override
  _ConsumerlegalformsState createState() => _ConsumerlegalformsState();
}

class _ConsumerlegalformsState extends State<Consumerlegalforms> {
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
                translate!.forms5,
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
          body: consumer(context)),
    );
  }

  consumer(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> consumerLegalforms = [
      Legalformsdatamodel(
          title: translate!.consumerform1,
          url:
              "https://drive.google.com/file/d/1iLc_DSZcdBa9boip4Je_-ywSqaCNxtVr/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.consumerform2,
          url:
              "https://drive.google.com/file/d/1dJ0WKB8AL_7D4ZyeBbnsT8SGX417Y12O/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: consumerLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: black),
              title: Text(
                consumerLegalforms[index].title,
                style: demofont,
              ),
              // onTap: ()=>{launch(legalforms[index].Url)});
              onTap: () {
                // showDialog(
                //     context: context,
                //     builder: (context) => AlertDialog(
                //           backgroundColor: dialog,
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
             
                launch(consumerLegalforms[index].url);
              });
        },
      ),
    );
  }
}
