import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/Legalforms_screen.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Trustlegalforms extends StatefulWidget {
  Trustlegalforms({Key? key}) : super(key: key);

  @override
  _TrustlegalformsState createState() => _TrustlegalformsState();
}

class _TrustlegalformsState extends State<Trustlegalforms> {
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
                translate!.forms1,
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
          body: trust(context)),
    );
  }

  trust(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> trustLegalforms = [
      Legalformsdatamodel(title: translate!.trustform1,url: ""),
      Legalformsdatamodel(title: translate.trustform2, url: "https://drive.google.com/file/d/1lDI5Wa8e0GS_xteRNouZ4H2xutN641ZA/view?usp=sharing"),
      Legalformsdatamodel(title: translate.trustform3, url: "https://drive.google.com/file/d/1oUzpQOm6_NM2BeCDQRLBFdLstYInWJIj/view?usp=sharing"),
      Legalformsdatamodel(title: translate.trustform4, url: "https://drive.google.com/file/d/1rmIogqdscKam5FspnrrCebY3tUpG0yzo/view?usp=sharing"),
      Legalformsdatamodel(title: translate.trustform5, url: "https://drive.google.com/file/d/1_p3nXQN_xOdnExrA-JLfBG450-DkJ8kK/view?usp=sharing"),
      Legalformsdatamodel(title: translate.trustform6, url: "https://drive.google.com/file/d/1AmIHFlgr0u_lUiUp8hGr3j1DpFL-tL4i/view?usp=sharing"),
      Legalformsdatamodel(title: translate.trustform7, url: "https://drive.google.com/file/d/1j-zlDBT4g04Ke4dth1qDxltnsUWx9UIz/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: trustLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(FontAwesomeIcons.filePdf),
              title: Text(
                trustLegalforms[index].title,
                // style: demofont,
              ),
              onTap: ()=>{launch(trustLegalforms[index].url)});
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
