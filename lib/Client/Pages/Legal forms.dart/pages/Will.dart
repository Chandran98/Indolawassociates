import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';


class Willlegalforms extends StatefulWidget {
  Willlegalforms({Key? key}) : super(key: key);

  @override
  _WilllegalformsState createState() => _WilllegalformsState();
}

class _WilllegalformsState extends State<Willlegalforms> {
  List<Legalformsdatamodel> will_legalforms = [
    Legalformsdatamodel(
        title: "Codicil substituting a trustee ", Url: ""),Legalformsdatamodel(
        title: "Codicil substituting a trustee appointed under Will ", Url: ""),Legalformsdatamodel(
        title: "Form of a complicated Will ", Url: ""),Legalformsdatamodel(
        title: "Revocation of will ", Url: ""),Legalformsdatamodel(
        title: "Short form of will ", Url: ""),Legalformsdatamodel(
        title: "Simple will ", Url: ""),Legalformsdatamodel(
        title: "Simple will giving all property to wife ", Url: ""),Legalformsdatamodel(
        title: "Will by a disabled person in favor of wife and daughter ", Url: ""),Legalformsdatamodel(
        title: "Will by a Hindu in favor of family ", Url: ""),Legalformsdatamodel(
        title: "Will in favor of minor son ", Url: ""),Legalformsdatamodel(
        title: "Will in favor of relations ", Url: ""),Legalformsdatamodel(
        title: "Will with several legacies and religious and charitable bequest and residue to vest in trustees for benefit of wife and children ", Url: ""),Legalformsdatamodel(
        title: "Will with trust for wife and children’s pecuniary legacies and annuities ", Url: ""),
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
          title: Text("Legal Forms-Wills Laws"),
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
            itemCount: will_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    will_legalforms[index].title,
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

















