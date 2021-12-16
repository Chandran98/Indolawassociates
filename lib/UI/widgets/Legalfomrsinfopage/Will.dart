import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/legalforms/formsinfo.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Willlegalforms extends StatefulWidget {
  Willlegalforms({Key? key}) : super(key: key);

  @override
  _WilllegalformsState createState() => _WilllegalformsState();
}

class _WilllegalformsState extends State<Willlegalforms> {
  void onback() {Navigator.pushNamed(context, legalformroute);
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
              toolbarHeight: 60.h,
              centerTitle: true,
              backgroundColor: white,
              title: FittedBox(
                child: Text(
                  translate!.forms2,
                  style: GoogleFonts.poppins(
                      color: black, fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
              ),
              leading: IconButton(
                  onPressed: () => Navigator.pushNamed(context, legalformroute),
                  icon: Image.asset(
                    "assets/icons/rback.png",
                    color: black,
                    height: 35,
                  )),
            ),
          body: wills(context)),
    );
  }

  wills(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> will_legalforms = [
      Legalformsdatamodel(title: translate!.willsform1, Url: ""),
      Legalformsdatamodel(title: translate.willsform2, Url: ""),
      Legalformsdatamodel(title: translate.willsform3, Url: ""),
      Legalformsdatamodel(title: translate.willsform4, Url: ""),
      Legalformsdatamodel(title: translate.willsform5, Url: ""),
      Legalformsdatamodel(title: translate.willsform6, Url: ""),
      Legalformsdatamodel(title: translate.willsform7, Url: ""),
      Legalformsdatamodel(title: translate.willsform8, Url: ""),
      Legalformsdatamodel(title: translate.willsform9, Url: ""),
      Legalformsdatamodel(title: translate.willsform10, Url: ""),
      Legalformsdatamodel(title: translate.willsform11, Url: ""),
      Legalformsdatamodel(title: translate.willsform12, Url: ""),
      Legalformsdatamodel(title: translate.willsform13, Url: ""),
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