import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Partnershiplegalforms extends StatefulWidget {
  Partnershiplegalforms({Key? key}) : super(key: key);

  @override
  _PartnershiplegalformsState createState() => _PartnershiplegalformsState();
}

class _PartnershiplegalformsState extends State<Partnershiplegalforms> {
 
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
      child:Consumer<Languagenotifier>(builder: (_,provider,snapshot){
        return Scaffold(
           appBar: AppBar(
              elevation: 3,
              toolbarHeight: 70,
              centerTitle: true,
              backgroundColor: dialog,
              title: FittedBox(
                child: Text(
                  translate!.forms12,
                style: titletextwhite,textAlign: TextAlign.center,
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
        body: partnership(context) );
    
      },));
  }partnership(context){    final translate = AppLocalizations.of(context);
List<Legalformsdatamodel> partnership_legalforms = [
    Legalformsdatamodel(
        title: translate!.partnershipform1,
        Url: ""),
    Legalformsdatamodel(title: translate.partnershipform2, Url: ""),
    Legalformsdatamodel(
        title: translate.partnershipform3, Url: ""),
    Legalformsdatamodel(title:translate.partnershipform4, Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform4,
        Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform5,
        Url: ""),
    Legalformsdatamodel(title: translate.partnershipform6, Url: ""),
    Legalformsdatamodel(title: translate.partnershipform7, Url: ""),
    Legalformsdatamodel(
        title:
           translate.partnershipform8,Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform9,
        Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform10,
        Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform11,
        Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform12, Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform13,
        Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform14, Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform15, Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform16,
        Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform17, Url: ""),
    Legalformsdatamodel(
        title:translate.partnershipform18,
        Url: ""),
  ];return  Padding(
          padding: const EdgeInsets.only(top:12.0,bottom: 12),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: partnership_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: black),
                  title: Text(
                    partnership_legalforms[index].title,
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
