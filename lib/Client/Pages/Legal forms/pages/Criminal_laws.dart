import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Criminallegalforms extends StatefulWidget {
  Criminallegalforms({Key? key}) : super(key: key);

  @override
  _CriminallegalformsState createState() => _CriminallegalformsState();
}

class _CriminallegalformsState extends State<Criminallegalforms> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Legal()));
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
            toolbarHeight: 60,
            backgroundColor: navy,
            title: FittedBox(child: Text(translate!.forms6,
              style: GoogleFonts.mulish(
                  color: white, fontWeight: FontWeight.w500, fontSize: 18.sp),)),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Legal())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: criminal(context)),
    );
  }

  criminal(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> criminal_legalforms = [
      Legalformsdatamodel(title: translate!.cirminalform1, Url: ""),
      Legalformsdatamodel(title: translate.cirminalform2, Url: ""),
      Legalformsdatamodel(title: translate.cirminalform3, Url: ""),
      Legalformsdatamodel(title: translate.cirminalform4, Url: ""),
      Legalformsdatamodel(title: translate.cirminalform5, Url: ""),
      Legalformsdatamodel(title: translate.cirminalform6, Url: ""),
      Legalformsdatamodel(title: translate.cirminalform7, Url: ""),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: criminal_legalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: navy),
              title: Text(
                criminal_legalforms[index].title,
                style: hStyle,
              ),
              // onTap: ()=>{launch(legalforms[index].Url)});
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          elevation: 10,
                          content: Text(
                            translate.helptitle,
                            style: hStyle,
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
                                    color: navy,
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      launcher("tel: 8940383000");
                                    },
                                    child: Text(
                                      "8940383000",
                                      style: hStyle,
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
