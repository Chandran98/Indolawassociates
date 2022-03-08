import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Familylegalforms extends StatefulWidget {
  Familylegalforms({Key? key}) : super(key: key);

  @override
  _FamilylegalformsState createState() => _FamilylegalformsState();
}

class _FamilylegalformsState extends State<Familylegalforms> {
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
                translate!.forms8,
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
          body: family(context)),
    );
  }

  family(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> familyLegalforms = [
      Legalformsdatamodel(title: translate!.familyform1, url: "https://drive.google.com/file/d/1q911N8yR5006BheZwA-6zhAy9188Pb11/view?usp=sharing"),
      Legalformsdatamodel(title: translate.familyform2, url: "https://drive.google.com/file/d/13W8hUhVZo0xFhzYNPrqCZoIDiaI0qK31/view?usp=sharing"),
      Legalformsdatamodel(title: translate.familyform3, url: "https://drive.google.com/file/d/1iPc5CfNmOKYaGOESQu3Ahi-JcsIKwVvc/view?usp=sharing"),
      Legalformsdatamodel(title: translate.familyform4, url: "https://drive.google.com/file/d/1bqF35LXGaPhqtfV7YuMOl9sqwYmRUEm0/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: familyLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye,),
              title: Text(
                familyLegalforms[index].title,
                // style: demofont,
              ),
              onTap: ()=>{launch(familyLegalforms[index].url)});
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
