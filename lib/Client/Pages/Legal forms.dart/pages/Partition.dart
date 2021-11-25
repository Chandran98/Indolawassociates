import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
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
  List<Legalformsdatamodel> partition_legalforms = [
    Legalformsdatamodel(
        title: "Confirmation of partition already made by the members of joint Hindu family ", Url: ""),  Legalformsdatamodel(
        title: "Deed evidencing oral partition ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partial Partition dividing the joint family business only while other properties remaining joint ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partial partition by one member from the other members of joint Hindu family ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partition ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partition between co-owners ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partition between members of a joint Hindu family ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partition between two tenants in common ", Url: ""),  Legalformsdatamodel(
        title: "Deed of partition with a cash payment for equalization ", Url: ""),  Legalformsdatamodel(
        title: "Family Arrangement ", Url: ""),  Legalformsdatamodel(
        title: "Partition deed ", Url: ""),
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
          title: Text("Legal Forms-Partition Laws"),
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
            itemCount: partition_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    partition_legalforms[index].title,
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


















