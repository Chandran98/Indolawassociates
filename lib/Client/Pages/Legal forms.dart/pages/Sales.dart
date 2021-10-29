import 'package:flutter/material.dart';
import 'package:indolawassociates/Client/Pages/Legal%20forms.dart/model/Legalforms_data_models.dart';
import 'package:indolawassociates/Client/Pages/bottomnavybar/Legalforms.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
class saleslegalforms extends StatefulWidget {
  saleslegalforms({Key? key}) : super(key: key);

  @override
  _saleslegalformsState createState() => _saleslegalformsState();
}

class _saleslegalformsState extends State<saleslegalforms> {
  List<Legalformsdatamodel> sales_legalforms = [
    Legalformsdatamodel(
        title:
            "Agreement for sale for purchase of a plot for constructing flats ",
        Url: ""),
    Legalformsdatamodel(title: "Agreements for sale of a home ", Url: ""),
    Legalformsdatamodel(
        title:
            "Agreement for sale of a house when purchase money is to be paid in installments                  ",
        Url: ""),
    Legalformsdatamodel(title: "Agreement for sale of an apartment ", Url: ""),
    Legalformsdatamodel(
        title:
            "Agreement for sale of flat by a flat purchase, when co-operative society has not been formed and flat is not ready ",
        Url: ""),
    Legalformsdatamodel(
        title: "Agreement for sale of free hold property ", Url: ""),
    Legalformsdatamodel(title: "Agreement for sale of future goods ", Url: ""),
    Legalformsdatamodel(title: "Agreement for sale of goods ", Url: ""),
    Legalformsdatamodel(
        title: "Agreement for sale of goods (C.I.F Basis) ", Url: ""),
    Legalformsdatamodel(
        title: "Defence In Any Suit for debt (F.O.B Basis) ", Url: ""),
    Legalformsdatamodel(
        title: "Agreement for sale of goods under the buyer's trade mark ",
        Url: ""),
    Legalformsdatamodel(
        title: "Agreement for sale of leasehold property ", Url: ""),
    Legalformsdatamodel(
        title: "Agreement for sale of mortgaged house ", Url: ""),
    Legalformsdatamodel(title: "Agreement for sale of ready goods ", Url: ""),
    Legalformsdatamodel(
        title: "Agreements for transfer of developments rights ", Url: ""),
    Legalformsdatamodel(
        title: "Agreements for sale technical equipment ", Url: ""),
    Legalformsdatamodel(title: "Deed in respect of leasehold ", Url: ""),
    Legalformsdatamodel(title: "Deed of a house ", Url: ""),
    Legalformsdatamodel(title: "Deed of apartment ", Url: ""),
    Legalformsdatamodel(
        title:
            "Deed of conveyance (where the consideration is payable by installments ",
        Url: ""),
    Legalformsdatamodel(title: "Deed of conveyance by mortgage ", Url: ""),
    Legalformsdatamodel(
        title: "Deed of conveyance in favor of mortgage ", Url: ""),
    Legalformsdatamodel(
        title:
            "Deed of conveyance of a property exclusive of a flat or floor in the building ",
        Url: ""),
    Legalformsdatamodel(title: "Deed of apartment ", Url: ""),
    Legalformsdatamodel(
        title:
            "Deed of conveyance (where the consideration is payable by installments ",
        Url: ""),
    Legalformsdatamodel(title: "Deed of conveyance by mortgage ", Url: ""),
    Legalformsdatamodel(
        title: "Deed of conveyance in favor of mortgage ", Url: ""),
    Legalformsdatamodel(
        title:
            "Deed of conveyance of a property exclusive of a flat or floor in the building ",
        Url: ""),
    Legalformsdatamodel(
        title: "Deed of conveyance of an interest in property ", Url: ""),
    Legalformsdatamodel(
        title: "Deed of conveyance of freehold property ", Url: ""),
    Legalformsdatamodel(title: "Deed of conveyance of reversion ", Url: ""),
    Legalformsdatamodel(
        title: "Deed of conveyance subject to right of way ", Url: ""),
    Legalformsdatamodel(
        title: "Development agreement by the landlords in front of a builder ",
        Url: ""),
    Legalformsdatamodel(
        title:
            "Form for obtaining income-tax clearance certificate under section 230a, income-tax act,1961 form no.34a ",
        Url: ""),
    Legalformsdatamodel(
        title:
            "Form of agreement to be entered between promoter and purchaser of flat ",
        Url: ""),
    Legalformsdatamodel(
        title:
            "Particulars of conditions of sale by auction of moveable property ",
        Url: ""),
    Legalformsdatamodel(
        title: "Sales by official liquidator of the company ", Url: ""),
    Legalformsdatamodel(
        title:
            "Sales deed by liquidator in the voluntary winding up of the company ",
        Url: ""),
    Legalformsdatamodel(title: "Sales deed of land with buildings ", Url: ""),
    Legalformsdatamodel(
        title: "Sales of a house by an executor appointed under will ",
        Url: ""),
    Legalformsdatamodel(
        title: "Sales of property to various purchases as tenants in common ",
        Url: ""),
    Legalformsdatamodel(
        title: "Sales of property to various purchasers in different portions ",
        Url: ""),
    Legalformsdatamodel(
        title:
            "Statement of transfer of immovable property for obtaining no-objection certificate from appointment authority income tax department form no.37-1 ",
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
          title: Text("Legal Forms-Sales Laws"),
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
            itemCount: sales_legalforms.length,
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Icon(Icons.remove_red_eye, color: navy),
                  title: Text(
                    sales_legalforms[index].title,
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
