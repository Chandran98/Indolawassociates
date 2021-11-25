import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Familylegalforms extends StatefulWidget {
  Familylegalforms({Key? key}) : super(key: key);

  @override
  _FamilylegalformsState createState() => _FamilylegalformsState();
}

class _FamilylegalformsState extends State<Familylegalforms> {
  List<Legalformsdatamodel> family_legalforms = [
    Legalformsdatamodel(
        title: "Adoption Deed ", Url: ""), Legalformsdatamodel(
        title: "Adoption by a Widow of a Son ", Url: ""), Legalformsdatamodel(
        title: "Adoption of a daughter by an Unmarried Women ", Url: ""), Legalformsdatamodel(
        title: "Divorce Petition by Hindu Wife on the Grounds of Cruelty ", Url: ""),
       ];

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Legal())
        );
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
          title: Text("Legal Forms-Family Laws"),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Legal())),
              icon: Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:12.0,bottom: 12),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: family_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    family_legalforms[index].title,
                    style: hStyle,
                  ),
                  // onTap: ()=>{launch(legalforms[index].Url)});
                  onTap: () {       showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              elevation: 10,
                              content: Text(
translate!.helptitle,                                style: hStyle,
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
        ),
      ),
    );
  }
}


















