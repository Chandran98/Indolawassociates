import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
class Trustlegalforms extends StatefulWidget {
  Trustlegalforms({Key? key}) : super(key: key);

  @override
  _TrustlegalformsState createState() => _TrustlegalformsState();
}

class _TrustlegalformsState extends State<Trustlegalforms> {
  List<Legalformsdatamodel> trust_legalforms = [
    Legalformsdatamodel(
        title: "Declaration of Trust (Public) ", Url: ""),Legalformsdatamodel(
        title: "Deed of Appointment of New Trustees ", Url: ""),Legalformsdatamodel(
        title: "Deed of Family Trust ", Url: ""),Legalformsdatamodel(
        title: "Deed of Private Trust ", Url: ""),Legalformsdatamodel(
        title: "Model Trust deed for a Private Specific Trust ", Url: ""),Legalformsdatamodel(
        title: "Public Charitable Trust ", Url: ""),Legalformsdatamodel(
        title: "Revocable Living Trust Agreements for an individual ", Url: ""),
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
          title: Text("Legal Forms-Trust Agreements Laws"),
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
            itemCount: trust_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    trust_legalforms[index].title,
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


















