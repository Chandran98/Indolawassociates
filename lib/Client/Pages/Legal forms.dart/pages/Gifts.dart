import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';


class Giftslegalforms extends StatefulWidget {
  Giftslegalforms({Key? key}) : super(key: key);

  @override
  _GiftslegalformsState createState() => _GiftslegalformsState();
}

class _GiftslegalformsState extends State<Giftslegalforms> {
  List<Legalformsdatamodel> gifts_legalforms = [
    Legalformsdatamodel(
        title: "Gift Of Books for Education of Daughter ", Url: ""),Legalformsdatamodel(
        title: "Gift Of Immovable Property ", Url: ""),Legalformsdatamodel(
        title: "Gift by father to his son of land by mortgage ", Url: ""),Legalformsdatamodel(
        title: "Gift by lady to her minor grand sons ", Url: ""),Legalformsdatamodel(
        title: "Gift of a house to the daughter ", Url: ""),Legalformsdatamodel(
        title: "Gift of a piece of land ", Url: ""),Legalformsdatamodel(
        title: "Gift of charity ", Url: ""),Legalformsdatamodel(
        title: "Gift of land for building a temple ", Url: ""),Legalformsdatamodel(
        title: "Gift of library to trust without reversion clause ", Url: ""),Legalformsdatamodel(
        title: "Gift of money to brother for meeting the marriage expenses of the niece of the donor ", Url: ""),Legalformsdatamodel(
        title: "Gift of money to grand son ", Url: ""),Legalformsdatamodel(
        title: "Gift to a purpose with a condition for revocation ", Url: ""),Legalformsdatamodel(
        title: "Gift to daughter ", Url: ""),Legalformsdatamodel(
        title: "Gift to son ", Url: ""),Legalformsdatamodel(
        title: "Gift with a condition for revocation                   ", Url: ""),
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
          title: Text("Legal Forms-Gifts Laws"),
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
            itemCount: gifts_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    gifts_legalforms[index].title,
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


















