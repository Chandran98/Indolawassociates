import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Giftslegalforms extends StatefulWidget {
  Giftslegalforms({Key? key}) : super(key: key);

  @override
  _GiftslegalformsState createState() => _GiftslegalformsState();
}

class _GiftslegalformsState extends State<Giftslegalforms> {
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
            // elevation: 3,/
            toolbarHeight: 70,
            centerTitle: true,
            // backgroundColor: dialog,
            title: FittedBox(
              child: Text(
                translate!.forms9,
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
          body: gifts(context)),
    );
  }

  gifts(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> giftsLegalforms = [
      Legalformsdatamodel(
          title: translate!.giftsform1,
          url:
              "https://drive.google.com/file/d/1l9UVXb_Mftqtr_akUT3rb7cwcst0anAA/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform2,
          url:
              "https://drive.google.com/file/d/15xqmEsmKsLa-YW02a5QUyji5dqBKzmvy/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform3,
          url:
              "https://drive.google.com/file/d/1lrWAEFnQs3fG3MFMu17W6QQnaNRlY1wr/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform4,
          url:
              "https://drive.google.com/file/d/1T9sSkOoOrjs2in2dEaGnYXYqBbU9qBHO/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform5,
          url:
              "https://drive.google.com/file/d/1DdZgDcjeKD_GnsW2Pwqhlian8ZsVAagH/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform6,
          url:
              "https://drive.google.com/file/d/1FOc_qPjTKxIaNeVHue9AwLPhqbqOODgQ/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform7,
          url:
              "https://drive.google.com/file/d/1bAucEDG8_RLPnbLg1JYtpDsplre66iFv/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform8,
          url:
              "https://drive.google.com/file/d/1EdRS_wvjimoBDSV9JtZELG3OME0EX7V5/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform9,
          url:
              "https://drive.google.com/file/d/1DuEKmDroGV7v1ZbA4QUqTgumq2xO0ZRi/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform10,
          url:
              "https://drive.google.com/file/d/1m8Mq8uSKxWDlpvWhCRQUj0KzZLNUvjT6/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform11,
          url:
              "https://drive.google.com/file/d/1xtJhfiMInWpvQOZL1qTMJX3HwokGS32N/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform12,
          url:
              "https://drive.google.com/file/d/1eufVG6O7U72zBSW4owfH45v2KEqoN1eL/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform13,
          url:
              "https://drive.google.com/file/d/1yaXNJWs_uZptoC3M61zAQ3_8PzrIf2wV/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform14,
          url:
              "https://drive.google.com/file/d/1GSVzAX7nKN5B5KH7hKRg5yIVjz7HrcxT/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.giftsform16,
          url:
              "https://drive.google.com/file/d/1odG-9xdLnfaEtk0BwqhOUQKeo8Z4IH6a/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: giftsLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye,),
              title: Text(
                giftsLegalforms[index].title,
                // style: demofont,
              ),
              onTap: () => {launch(giftsLegalforms[index].url)});
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
