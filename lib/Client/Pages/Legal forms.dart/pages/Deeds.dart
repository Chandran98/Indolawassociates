import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';


class Deedslegalforms extends StatefulWidget {
  Deedslegalforms({Key? key}) : super(key: key);

  @override
  _DeedslegalformsState createState() => _DeedslegalformsState();
}

class _DeedslegalformsState extends State<Deedslegalforms> {
  List<Legalformsdatamodel> deed_legalforms = [
    Legalformsdatamodel(title: "Deed For Assignment of Copyright ", Url: ""),
    Legalformsdatamodel(title: "Deed of Guarantee ", Url: ""),
    Legalformsdatamodel(title: "Deed creating charge on the property ", Url: ""),
    Legalformsdatamodel(title: "Deed of Assignment of Patent ", Url: ""),
    Legalformsdatamodel(title: "Deed of Conveyance by the Official Liquidator of a Limited Company ", Url: ""),
    Legalformsdatamodel(title: "Deed of Indemnity ", Url: ""),
    Legalformsdatamodel(title: "Deed of adoption ", Url: ""),
    Legalformsdatamodel(title: "Deed of adoption of a son ", Url: ""),
    Legalformsdatamodel(title: "Deed of conditional Gift ", Url: ""),
    Legalformsdatamodel(title: "Deed of English mortgage between an individual and a firm of money lenders ", Url: ""),
    Legalformsdatamodel(title: "Deed of family arrangement for release of property in favor of other beneficiaries in consideration of annuity         ", Url: ""),
    Legalformsdatamodel(title: "Deed of family settlement between the heirs of a deceased           ", Url: ""),
    Legalformsdatamodel(title: "Deed of gift of good will of business                     ", Url: ""),
    Legalformsdatamodel(title: "Deed of gift of immovable property                                      ", Url: ""),
    Legalformsdatamodel(title: "Deed of gift of movable property     ", Url: ""),
    Legalformsdatamodel(title: "Deed of mortgage by conditional sale ", Url: ""),
    Legalformsdatamodel(title: "Deed of settlement under which a son agrees to pay down debt to his father                     ", Url: ""),
    Legalformsdatamodel(title: "Deed of sub lease ", Url: ""),
    Legalformsdatamodel(title: "Deed of surrender of lease ", Url: ""),
    Legalformsdatamodel(title: "Deed of surrender of the whole property ", Url: ""),
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
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: navy,
          title: Text("Legal Forms-Deeds Laws"),
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
            itemCount: deed_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    deed_legalforms[index].title,
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
             });
            },
          ),
        ),
      ),
    );
  }
}
