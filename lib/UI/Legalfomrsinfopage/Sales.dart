import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class saleslegalforms extends StatefulWidget {
  saleslegalforms({Key? key}) : super(key: key);

  @override
  _saleslegalformsState createState() => _saleslegalformsState();
}

class _saleslegalformsState extends State<saleslegalforms> {
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
              toolbarHeight: 60.h,
              centerTitle: true,
              backgroundColor: white,
              title: FittedBox(
                child: Text(
                  translate!.forms13,
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
          body: sales(context)),
    );
  }

  sales(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> sales_legalforms = [
      Legalformsdatamodel(title: translate!.salesform1, Url: ""),
      Legalformsdatamodel(title: translate.salesform2, Url: ""),
      Legalformsdatamodel(title: translate.salesform3, Url: ""),
      Legalformsdatamodel(title: translate.salesform4, Url: ""),
      Legalformsdatamodel(title: translate.salesform5, Url: ""),
      Legalformsdatamodel(title: translate.salesform6, Url: ""),
      Legalformsdatamodel(title: translate.salesform7, Url: ""),
      Legalformsdatamodel(title: translate.salesform8, Url: ""),
      Legalformsdatamodel(title: translate.salesform9, Url: ""),
      Legalformsdatamodel(title: translate.salesform10, Url: ""),
      Legalformsdatamodel(title: translate.salesform11, Url: ""),
      Legalformsdatamodel(title: translate.salesform12, Url: ""),
      Legalformsdatamodel(title: translate.salesform13, Url: ""),
      Legalformsdatamodel(title: translate.salesform14, Url: ""),
      Legalformsdatamodel(title: translate.salesform15, Url: ""),
      Legalformsdatamodel(title: translate.salesform16, Url: ""),
      Legalformsdatamodel(title: translate.salesform17, Url: ""),
      Legalformsdatamodel(title: translate.salesform18, Url: ""),
      Legalformsdatamodel(title: translate.salesform19, Url: ""),
      Legalformsdatamodel(title: translate.salesform20, Url: ""),
      Legalformsdatamodel(title: translate.salesform21, Url: ""),
      Legalformsdatamodel(title: translate.salesform22, Url: ""),
      Legalformsdatamodel(title: translate.salesform23, Url: ""),
      Legalformsdatamodel(title: translate.salesform24, Url: ""),
      Legalformsdatamodel(title: translate.salesform25, Url: ""),
      Legalformsdatamodel(title: translate.salesform26, Url: ""),
      Legalformsdatamodel(title: translate.salesform27, Url: ""),
      Legalformsdatamodel(title: translate.salesform28, Url: ""),
      Legalformsdatamodel(title: translate.salesform29, Url: ""),
      Legalformsdatamodel(title: translate.salesform30, Url: ""),
      Legalformsdatamodel(title: translate.salesform31, Url: ""),
      Legalformsdatamodel(title: translate.salesform32, Url: ""),
      Legalformsdatamodel(title: translate.salesform33, Url: ""),
      Legalformsdatamodel(title: translate.salesform34, Url: ""),
      Legalformsdatamodel(title: translate.salesform35, Url: ""),
      Legalformsdatamodel(title: translate.salesform36, Url: ""),
      Legalformsdatamodel(title: translate.salesform37, Url: ""),
      Legalformsdatamodel(title: translate.salesform38, Url: ""),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: sales_legalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: black),
              title: Text(
                sales_legalforms[index].title,
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
