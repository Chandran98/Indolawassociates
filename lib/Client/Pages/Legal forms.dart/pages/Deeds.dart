import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Deedslegalforms extends StatefulWidget {
  Deedslegalforms({Key? key}) : super(key: key);

  @override
  _DeedslegalformsState createState() => _DeedslegalformsState();
}

class _DeedslegalformsState extends State<Deedslegalforms> {
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
            title: FittedBox(
              child: Text(translate!.forms7,
                style: GoogleFonts.mulish(
                    color: white, fontWeight: FontWeight.w500, fontSize: 18.sp),),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Legal())),
                icon: Icon(Icons.arrow_back)),
          ),
          body: deeds(context)),
    );
  }

  deeds(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> deed_legalforms = [
      Legalformsdatamodel(title: translate!.deeds1, Url: ""),
      Legalformsdatamodel(title: translate.deeds2, Url: ""),
      Legalformsdatamodel(title: translate.deeds3, Url: ""),
      Legalformsdatamodel(title: translate.deeds4, Url: ""),
      Legalformsdatamodel(title: translate.deeds5, Url: ""),
      Legalformsdatamodel(title: translate.deeds6, Url: ""),
      Legalformsdatamodel(title: translate.deeds7, Url: ""),
      Legalformsdatamodel(title: translate.deeds8, Url: ""),
      Legalformsdatamodel(title: translate.deeds9, Url: ""),
      Legalformsdatamodel(title: translate.deeds10, Url: ""),
      Legalformsdatamodel(title: translate.deeds11, Url: ""),
      Legalformsdatamodel(title: translate.deeds12, Url: ""),
      Legalformsdatamodel(title: translate.deeds13, Url: ""),
      Legalformsdatamodel(title: translate.deeds14, Url: ""),
      Legalformsdatamodel(title: translate.deeds15, Url: ""),
      Legalformsdatamodel(title: translate.deeds16, Url: ""),
      Legalformsdatamodel(title: translate.deeds17, Url: ""),
      Legalformsdatamodel(title: translate.deeds18, Url: ""),
      Legalformsdatamodel(title: translate.deeds19, Url: ""),
      Legalformsdatamodel(title: translate.deeds20, Url: ""),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: deed_legalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: navy),
              title: Text(
                deed_legalforms[index].title,
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
