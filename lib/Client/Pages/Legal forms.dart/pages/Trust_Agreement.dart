import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Trustlegalforms extends StatefulWidget {
  Trustlegalforms({Key? key}) : super(key: key);

  @override
  _TrustlegalformsState createState() => _TrustlegalformsState();
}

class _TrustlegalformsState extends State<Trustlegalforms> {
 

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
  Widget build(BuildContext context) {        final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: navy,
          title: FittedBox(child: Text(translate!.forms1,style: GoogleFonts.mulish(color: white,fontWeight: FontWeight.w500,fontSize: 18.sp),)),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Legal())),
              icon: Icon(Icons.arrow_back)),
        ),
        body:   trust(context)),
    );
  } 
  trust(context){    final translate = AppLocalizations.of(context);
 List<Legalformsdatamodel> trust_legalforms = [
    Legalformsdatamodel(
        title: translate!.trustform1, Url: ""),Legalformsdatamodel(
        title: translate.trustform2, Url: ""),Legalformsdatamodel(
        title: translate.trustform3, Url: ""),Legalformsdatamodel(
        title: translate.trustform4, Url: ""),Legalformsdatamodel(
        title:translate.trustform5, Url: ""),Legalformsdatamodel(
        title: translate.trustform6, Url: ""),Legalformsdatamodel(
        title: translate.trustform7, Url: ""),
       ];
       return  Padding(
          padding: const EdgeInsets.only(top:12.0,bottom: 12),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: trust_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    trust_legalforms[index].title,
                    style: hStyle,
                  ),
                  // onTap: ()=>{launch(legalforms[index].Url)});
                  onTap: () {       showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              elevation: 10,
                              content: Text(
translate.helptitle,                                style: hStyle,
                              ),
                              contentPadding: EdgeInsets.only(
                                  top: 20, left: 20, right: 20, bottom: 10),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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


















