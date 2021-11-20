import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Businesslegalforms extends StatefulWidget {
  Businesslegalforms({Key? key}) : super(key: key);

  @override
  _BusinesslegalformsState createState() => _BusinesslegalformsState();
}

class _BusinesslegalformsState extends State<Businesslegalforms> {
  List<Legalformsdatamodel> businesslegalforms = [
    Legalformsdatamodel(
        title:
            "Administration by Creditor on Behalf of Himself and All other Creditors",
        Url: ""),
    Legalformsdatamodel(title: "Administration by Specific Legatee", Url: ""),
    Legalformsdatamodel(
        title: "Affidavit for Condo Nation of Delay in filling an appeal",
        Url: ""),
    Legalformsdatamodel(title: "Against Surety for payment of Rent", Url: ""),
    Legalformsdatamodel(
        title: "Against a Builder for Defective Workmanship", Url: ""),
    Legalformsdatamodel(
        title: "Against a Fraudulent Purchaser and his Trans fee with Notice",
        Url: ""),
    Legalformsdatamodel(title: "An Injunction restricting Waste", Url: ""),
    Legalformsdatamodel(title: "Breach of Agreements to Purchase land", Url: ""),
    Legalformsdatamodel(title: "Carrying on Noxious Manufacture", Url: ""),
    Legalformsdatamodel(
        title: "Against a Fraudulent Purchaser and his Trans fee with Notice",
        Url: ""),
    Legalformsdatamodel(title: "An Injunction restricting Waste", Url: ""),
    Legalformsdatamodel(title: "Breach of Agreements to Purchase land", Url: ""),
    Legalformsdatamodel(title: "Carrying on noxious Manufacture", Url: ""),
    Legalformsdatamodel(title: "Defence In Any Suit for debt", Url: ""),
    Legalformsdatamodel(
        title: "Defence in administration suit by Pecuniary Legatee", Url: ""),
    Legalformsdatamodel(title: "Defence in All Suits for Wrongs", Url: ""),
    Legalformsdatamodel(title: "Defence in Suits for Detention of Goods", Url: ""),
    Legalformsdatamodel(
        title: "Defence in Suits for Goods Sold and Delivered", Url: ""),
    Legalformsdatamodel(
        title: "Defence in Suits for Infringement of Copyright", Url: ""),
    Legalformsdatamodel(title: "Defence in Suits on Bonds", Url: ""),
  ];

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
    return WillPopScope( onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: navy,
          title: Text("Legal Forms-Business"),
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
            itemCount: businesslegalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    businesslegalforms[index].title,
                    style: hStyle,
                  ),
                  // onTap: ()=>{launch(legalforms[index].Url)});
                  onTap: () {       showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              elevation: 10,
                              content: Text(
                                "Contact Support team for the forms realated to your issues",
                                style: hStyle,
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
             }
                  );
            },
          ),
        ),
      ),
    );
  }
}