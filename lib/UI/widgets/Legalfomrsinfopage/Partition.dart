import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Partitionlegalforms extends StatefulWidget {
  Partitionlegalforms({Key? key}) : super(key: key);

  @override
  _PartitionlegalformsState createState() => _PartitionlegalformsState();
}

class _PartitionlegalformsState extends State<Partitionlegalforms> {
 
  void onback() { Navigator.pushNamed(context, legalformroute);
  }


  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  @override
  Widget build(BuildContext context) {        final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
              elevation: 3,
              toolbarHeight: 9.h,
              centerTitle: true,
              backgroundColor: dialog,
              title: FittedBox(
                child: Text(
                  translate!.forms11,
                  style: GoogleFonts.poppins(
                      color: white, fontWeight: FontWeight.w500, fontSize: 13.sp),
                ),
              ),
              leading: IconButton(
                  onPressed: () =>  Navigator.pushNamed(context, legalformroute),
                  icon: Image.asset(
                    "assets/icons/rback.png",
                    color: white,
                    height: 35,
                  )),
            ),
        body: partition(context)    ),
    );
  }
  partition(context){    final translate = AppLocalizations.of(context);
 List<Legalformsdatamodel> partition_legalforms = [
    Legalformsdatamodel(
        title: translate!.partitionform1, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform2, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform3, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform4, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform5, Url: ""),  Legalformsdatamodel(
        title:translate.partitionform6, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform7, Url: ""),  Legalformsdatamodel(
        title:translate.partitionform8, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform9, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform10, Url: ""),  Legalformsdatamodel(
        title: translate.partitionform11, Url: ""),
       ];return Padding(
          padding: const EdgeInsets.only(top:12.0,bottom: 12),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: partition_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: black),
                  title: Text(
                    partition_legalforms[index].title,
                    style: demofont,
                  ),
                  // onTap: ()=>{launch(legalforms[index].Url)});
                  onTap: () {   
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(backgroundColor: dialog,
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


















