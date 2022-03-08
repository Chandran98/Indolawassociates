import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Deedslegalforms extends StatefulWidget {
  Deedslegalforms({Key? key}) : super(key: key);

  @override
  _DeedslegalformsState createState() => _DeedslegalformsState();
}

class _DeedslegalformsState extends State<Deedslegalforms> {
  void onback() { Navigator.pushNamed(context, legalformroute);
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
                  translate!.forms7,
                // style: titletextwhite
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
          body: deeds(context)),
    );
  }

  deeds(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> deedLegalforms = [
      Legalformsdatamodel(title: translate!.deeds1, url: "https://drive.google.com/file/d/1owk2Sgl3L9p1phYZ_FzzQgd3_Fg6qMaf/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds2, url: "https://drive.google.com/file/d/1eL7OEkbOGNB1C5sVs_LQSOvBFfvacbUh/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds3, url: "https://drive.google.com/file/d/1WhsrVPyN-trEL1PdmydQ3DG6Vpu5hueE/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds4, url: "https://drive.google.com/file/d/1Y-UsEXA0vB0fMGFxRAe3tZAnLhLOOS0a/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds5, url: "https://drive.google.com/file/d/1e_E4A4o4nAQHt0Omkd9c0t-f7f0L4QNO/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds6, url: "https://drive.google.com/file/d/1SjbULGmAqmkehEpg45B-ATaYh6pcYn4s/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds7, url: "https://drive.google.com/file/d/1xnXOWgmMB1pL56d2UHjBtgFSOfT9KPbH/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds8, url: "https://drive.google.com/file/d/14bcXSfpD1nYHKhpXC5uEXu6hN4WnUAq9/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds9, url: "https://drive.google.com/file/d/10W2oN58XB-RnQaJ5sKqXtAcIfVhI4pqZ/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds10, url: "https://drive.google.com/file/d/1Qjk3VBCRIblXu98U9utivo2rpHf9wrdv/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds11, url: "https://drive.google.com/file/d/1ojMtPP-panfvjh-RhJVRr5kYXrf9dSe3/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds12, url: "https://drive.google.com/file/d/1L67G8XoqsTLeW6HSlclCXAHpUKp0U_Bx/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds13, url: "https://drive.google.com/file/d/1znzAkCNEhi53IlZlTKa-2kXLv4Liy5hD/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds14, url: "https://drive.google.com/file/d/1CTzmm9_BcUo-f99OBsK8Xo616zGhhpDE/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds15, url: ""),
      Legalformsdatamodel(title: translate.deeds16, url: "https://drive.google.com/file/d/1PRWZp9FnhpuNbl6no762h3xW1iGbs2ax/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds17, url: "https://drive.google.com/file/d/1tyze0HURVRuUVCN6PlMaTKwcgTFF7Tje/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds18, url: "https://drive.google.com/file/d/1lbQH-n67zWBvYrwVSg51KBM0w90ww79Y/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds19, url: "https://drive.google.com/file/d/1lQ4wcyHgkUJfV5ghbCvMDBG9z1GzXcZL/view?usp=sharing"),
      Legalformsdatamodel(title: translate.deeds20, url: "https://drive.google.com/file/d/10kNbqRD9Rq0c6yhYDtbczAfGZEaDIPE0/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: deedLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye,),
              title: Text(
                deedLegalforms[index].title,
                // style: demofont,
              ),
              onTap: ()=>{launch(deedLegalforms[index].url)}
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
              // }
              );
     
        },
      ),
    );
  }
}
