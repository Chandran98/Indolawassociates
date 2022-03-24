import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class saleslegalforms extends StatefulWidget {
  saleslegalforms({Key? key}) : super(key: key);

  @override
  _saleslegalformsState createState() => _saleslegalformsState();
}

class _saleslegalformsState extends State<saleslegalforms> {
  void onback() {
    Navigator.pushNamed(context, legalformroute);
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
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            // elevation: 3,
            toolbarHeight: 70,
            centerTitle: true,
            // backgroundColor: dialog,
            title: FittedBox(
              child: Text(
                translate!.forms13,
                // style: titletextwhite,
                textAlign: TextAlign.center,
              ),
            ),
              leading: IconButton(
                  onPressed: () => Navigator.pushNamed(context, legalformroute),
                  icon: Icon(
                    Icons.arrow_back, 
                    // height: 35,
                  )),
          ),
          body: sales(context)),
    );
  }

  sales(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> salesLegalforms = [
      Legalformsdatamodel(title: translate!.salesform1, url: ""),
      Legalformsdatamodel(
          title: translate.salesform2,
          url:
              "https://drive.google.com/file/d/1RRI91xUtKM3D2g3WS_CyoLG_CcHwVUDq/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform3,
          url:
              "https://drive.google.com/file/d/1363sAYtPXXQeQOTGtQ4JJxBmS609noc1/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform4,
          url:
              "https://drive.google.com/file/d/1n6OXODMUnRvz0eCxyf4cZBbt9hMCD0Vd/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform5,
          url:
              "https://drive.google.com/file/d/1E_moewNNnIbBtEyFf4a7LENTv0yU7LFM/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform6,
          url:
              "https://drive.google.com/file/d/1S0LZo0T4421-Ckb8em1eOKrFAQ-936up/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform7,
          url:
              "https://drive.google.com/file/d/1_86Qn28Q6a8Pe4aT7s-VyFG_RdAief_e/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform8,
          url:
              "https://drive.google.com/file/d/1q_6gY2VkXDUGCP6DwJjnyv3foSI6Hi5q/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform9,
          url:
              "https://drive.google.com/file/d/1-cF-aZb_ndRsYzoqmDmtFnNe0olyMVwa/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform10,
          url:
              "https://drive.google.com/file/d/1_y0S8z8pw5ICkGFDL0ktrAFqg772Bzh3/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform11,
          url:
              "https://drive.google.com/file/d/16sICSAW3v-AJBAwM97v_IJ4j7gXZuaVD/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform12,
          url:
              "https://drive.google.com/file/d/1juWB9_Kel8vw0SuKVn7SYon9ObfYR5u9/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform13,
          url:
              "https://drive.google.com/file/d/1JoFm5F4DQ1t5uUkDvsxv1haIbkk5Bd_J/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform14,
          url:
              "https://drive.google.com/file/d/1kURqExLEE1QryU4cIxL2fhU0eo7mwEzd/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform15,
          url:
              "https://drive.google.com/file/d/14Rw3y-mV_T66MSe6eRb4syUV5WQP_zAq/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform16,
          url:
              "https://drive.google.com/file/d/1dDtrEkCwy1QYWgfyw1tFIoCmdzbfZRDZ/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform17,
          url:
              "https://drive.google.com/file/d/1nojIWV-Dfi3pTJ5pPsI24ISTMrhK3kdC/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform18,
          url:
              "https://drive.google.com/file/d/1IImbwCjDXVEmExygqaEZzW1AOMYHyoSX/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform19,
          url:
              "https://drive.google.com/file/d/1B6g9htBpI5l7Ry34sQT9KKdinbSq3gB2/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform20,
          url:
              "https://drive.google.com/file/d/1RV1tOhM4w4tyHBUeV11jEiQbr3aIJnqt/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform21,
          url:
              "https://drive.google.com/file/d/1H7QIbffie9wGZgRQKesSaOIiSdwytThZ/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform22,
          url:
              "https://drive.google.com/file/d/1BiInkDGsT2nNd3vAyKUIIYhIUiI1H6AC/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform23,
          url:
              "https://drive.google.com/file/d/1ecP6yVJ6j1I1du21OZ2uuvUrNjsTOBc-/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform24,
          url:
              "https://drive.google.com/file/d/1ZWiAaKRvgzTByu77wAPk0wXST2S-Pe8w/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform25,
          url:
              "https://drive.google.com/file/d/14HjnhxSxqhzBsCkmSF4FNqnf4yYrYYpq/view?usp=sharing"),
      Legalformsdatamodel(title: translate.salesform26, url: ""),
      Legalformsdatamodel(
          title: translate.salesform27,
          url:
              "https://drive.google.com/file/d/1dAt92-0gMASrlJYsOpim8oFQovD63rIc/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform28,
          url:
              "https://drive.google.com/file/d/1S6CGDxImQelOztKEtO4JJosZzuarN3SI/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform29,
          url:
              "https://drive.google.com/file/d/13ZH4X1hHatfPrfxhRfz0Lrx1IZzl6Wa8/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform30,
          url:
              "https://drive.google.com/file/d/1ZIWfbi0lpREHfvPnUsk0eMhQuoRk_fjW/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform31,
          url:
              "https://drive.google.com/file/d/1Z2pkhHJJw5DCEeiY8ErpvxOFmyIlYl9W/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform32,
          url:
              "https://drive.google.com/file/d/1Hp2WbqEARhp_Lg248lSETU1tXrsY7lJB/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform33,
          url:
              "https://drive.google.com/file/d/1Lf4ENz9g4zDe-EZKgkMif6W1HOenVIWq/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform34,
          url:
              "https://drive.google.com/file/d/1RyTI4HaTpOH9Q8-I4Hzpeojwj2fqafyt/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform35,
          url:
              "https://drive.google.com/file/d/1DVdYC_L_m4KCqwbd3ImJGSANHZoa7OLq/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform36,
          url:
              "https://drive.google.com/file/d/1e-HccysTfCJySzSycQL9M5i_aAKLaJDm/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform37,
          url:
              "https://drive.google.com/file/d/1HGxazG3x_SXCjumO7B5dXhkpnVRf6iU0/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.salesform38,
          url:
              "https://drive.google.com/file/d/1rtvT8c5NnT5IYSiT3bisNBrZ6QUdkG3j/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: salesLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(FontAwesomeIcons.filePdf),
              title: Text(
                salesLegalforms[index].title,
                // style: demofont,
              ),
              onTap: () => {launch(salesLegalforms[index].url)});
          // onTap: () {

          //   showDialog(
          //       context: context,
          //       builder: (context) => AlertDialog(backgroundColor: dialog,
          //             elevation: 10,
          //             content: Text(
          //               translate.helptitle,
          //               style: dfont,
          //             ),
          //             contentPadding: EdgeInsets.only(
          //                 top: 20, left: 20, right: 20, bottom: 10),
          //             actions: [
          //               Padding(
          //                 padding:
          //                     const EdgeInsets.symmetric(horizontal: 10),
          //                 child: Row(
          //                   children: [
          //                     Icon(
          //                       Icons.phone,
          //                       color: white,
          //                     ),
          //                     FlatButton(
          //                       onPressed: () {
          //                         launcher("tel: 8940383000");
          //                       },
          //                       child: Text(
          //                         "8940383000",
          //                         style: dfont,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               )
          //             ],
          //           ));
          // });
        },
      ),
    );
  }
}
