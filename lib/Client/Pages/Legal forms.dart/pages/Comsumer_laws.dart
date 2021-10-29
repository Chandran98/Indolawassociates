import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

class Consumerlegalforms extends StatefulWidget {
  Consumerlegalforms({Key? key}) : super(key: key);

  @override
  _ConsumerlegalformsState createState() => _ConsumerlegalformsState();
}

class _ConsumerlegalformsState extends State<Consumerlegalforms> {
  List<Legalformsdatamodel> consumer_legalforms = [
    Legalformsdatamodel(
        title: "Complaints against Airlines converted", Url: ""),
    Legalformsdatamodel(
        title: "Consumer Complaint before the District Consumer Dispute Redressal Forum", Url: ""),
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
          title: Text("Legal Forms-Consumer Laws"),
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
            itemCount: consumer_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    consumer_legalforms[index].title,
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


















