import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

class Criminallegalforms extends StatefulWidget {
  Criminallegalforms({Key? key}) : super(key: key);

  @override
  _CriminallegalformsState createState() => _CriminallegalformsState();
}

class _CriminallegalformsState extends State<Criminallegalforms> {
  List<Legalformsdatamodel> criminal_legalforms = [
    Legalformsdatamodel(
        title: "F.I.R (First Information Report)  ", Url: ""),
    Legalformsdatamodel(
        title: "Anticipatory Bail Application ", Url: ""),
    Legalformsdatamodel(
        title: "Bail Application ", Url: ""),
    Legalformsdatamodel(
        title: "Bail Bond After Arrest Under a Warrant", Url: ""),
    Legalformsdatamodel(
        title: "Bond For Good Behavior ", Url: ""),
    Legalformsdatamodel(
        title: "Bond To Keep Peace ", Url: ""),
    Legalformsdatamodel(
        title: "Bond and Bail Bond for Attendance before Office in Charge of Police Station or Court", Url: ""),
       ];

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Legal()));
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
          title: Text("Legal Forms-Criminal Laws"),
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
            itemCount: criminal_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    criminal_legalforms[index].title,
                    style: hStyle,
                  ),
                  // onTap: ()=>{launch(legalforms[index].Url)});
                  onTap: () {});
            },
          ),
        ),
      ),
    );
  }
}

















