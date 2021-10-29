import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart'
;

class Mortgagelegalforms extends StatefulWidget {
  Mortgagelegalforms({Key? key}) : super(key: key);

  @override
  _MortgagelegalformsState createState() => _MortgagelegalformsState();
}

class _MortgagelegalformsState extends State<Mortgagelegalforms> {
  List<Legalformsdatamodel> mortgage_legalforms = [
    Legalformsdatamodel(
        title: "Agreement reducing the rate of interest in mortgage deed ", Url: ""),Legalformsdatamodel(
        title: "Another deed of reconveyance for reconvening mortgaged property ", Url: ""),Legalformsdatamodel(
        title: "Deed creating charge on the property ", Url: ""),Legalformsdatamodel(
        title: "Mortgage by conditional sale ", Url: ""),Legalformsdatamodel(
        title: "Reconveyance deed ", Url: ""),Legalformsdatamodel(
        title: "Record or mortgage by deposit of title deeds ", Url: ""),Legalformsdatamodel(
        title: "Second Mortgage ", Url: ""),Legalformsdatamodel(
        title: "Simple mortgage by manager of joint Hindu family for legal necessity ", Url: ""),Legalformsdatamodel(
        title: "Simple mortgage deed ", Url: ""),Legalformsdatamodel(
        title: "Simple mortgage deed in the form of a deed ", Url: ""),
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
          title: Text("Legal Forms-Mortgage Laws"),
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
            itemCount: mortgage_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    mortgage_legalforms[index].title,
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


















