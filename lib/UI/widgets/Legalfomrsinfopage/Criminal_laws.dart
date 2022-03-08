import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Criminallegalforms extends StatefulWidget {
  Criminallegalforms({Key? key}) : super(key: key);

  @override
  _CriminallegalformsState createState() => _CriminallegalformsState();
}

class _CriminallegalformsState extends State<Criminallegalforms> {
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
                translate!.forms6,
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
          body: criminal(context)),
    );
  }

  criminal(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> criminalLegalforms = [
      Legalformsdatamodel(title: translate!.cirminalform1,url: "https://drive.google.com/file/d/1EdSp2bAwdFySGfpDSQ4W5eY2-NHMuXrQ/view?usp=sharing"),
      Legalformsdatamodel(title: translate.cirminalform2, url: "https://drive.google.com/file/d/1SDH0tdSVnN7yEyItilpuCkXC5JXc5ebY/view?usp=sharing"),
      Legalformsdatamodel(title: translate.cirminalform3, url: "https://drive.google.com/file/d/1nwucQ4UIRvzusdBGPs0YbRM3aZq-_BGo/view?usp=sharing"),
      Legalformsdatamodel(title: translate.cirminalform4, url: ""),
      Legalformsdatamodel(title: translate.cirminalform5, url: "https://drive.google.com/file/d/1jPXZ2PSxNDls1plAxs6DnHsUtCiWgZ0O/view?usp=sharing"),
      Legalformsdatamodel(title: translate.cirminalform6, url: "https://drive.google.com/file/d/14vEPXfw-CpifcLlKsa7qiPwKYVZ7rX1g/view?usp=sharing"),
      Legalformsdatamodel(title: translate.cirminalform7, url: "https://drive.google.com/file/d/10mHxr6lHyw69I0h0m_MaD9Wa_rJCJ48l/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: criminalLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye,),
              title: Text(
                criminalLegalforms[index].title,
                // style: demofont,
              ),
              onTap: ()=>{launch(criminalLegalforms[index].url)}
              // onTap: () {
        
              //   showDialog(
              //       context: context,
              //       builder: (context) => AlertDialog(backgroundColor: dialog,
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
              // }
              );
        },
      ),
    );
  }
}
