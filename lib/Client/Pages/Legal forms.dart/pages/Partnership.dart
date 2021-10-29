import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

class Partnershiplegalforms extends StatefulWidget {
  Partnershiplegalforms({Key? key}) : super(key: key);

  @override
  _PartnershiplegalformsState createState() => _PartnershiplegalformsState();
}

class _PartnershiplegalformsState extends State<Partnershiplegalforms> {
  List<Legalformsdatamodel> partnership_legalforms = [
    Legalformsdatamodel(
        title: "Agreement admitting a minor to the benefit of partnership ",
        Url: ""),
    Legalformsdatamodel(title: "Agreement admitting a new partner ", Url: ""),
    Legalformsdatamodel(
        title: "Agreement modifying the partnership deed ", Url: ""),
    Legalformsdatamodel(title: "Another partnership deeds ", Url: ""),
    Legalformsdatamodel(
        title:
            "Deed of dissolution where one partner takes over assets and liabilities of the business ",
        Url: ""),
    Legalformsdatamodel(
        title:
            "Deed of dissolution where the business is continued by some partners ",
        Url: ""),
    Legalformsdatamodel(title: "Deed of partnership ", Url: ""),
    Legalformsdatamodel(title: "Deed of retirement ", Url: ""),
    Legalformsdatamodel(
        title:
            "Form of furnishing statement specifying alteration in the firm name or in the location of the principal place of business of the firm ",
        Url: ""),
    Legalformsdatamodel(
        title: "Form of giving notice of change of constitutional of the firm ",
        Url: ""),
    Legalformsdatamodel(
        title: "Notice of retirement by one partner to other partners ",
        Url: ""),
    Legalformsdatamodel(
        title:
            "Partnership agreement between a partnership firm and a Hindu joint family ",
        Url: ""),
    Legalformsdatamodel(
        title: "Partnership agreement between advocates ", Url: ""),
    Legalformsdatamodel(
        title:
            "Partnership agreement between an individual a partnership firm and a company                    ",
        Url: ""),
    Legalformsdatamodel(
        title: "Partnership agreement between two partnership firms ", Url: ""),
    Legalformsdatamodel(
        title: "Partnership agreement between two Limited Companies ", Url: ""),
    Legalformsdatamodel(
        title:
            "Partnership agreement between a partnership firm and a Hindu joint family",
        Url: ""),
    Legalformsdatamodel(
        title: "Partnership agreement for a single venture ", Url: ""),
    Legalformsdatamodel(
        title:
            "Preliminary notice to a partner to show an opportunity why he should not be expelled from partnership. ",
        Url: ""),
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
          title: Text("Legal Forms-Partnership Laws"),
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
            itemCount: partnership_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    partnership_legalforms[index].title,
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
