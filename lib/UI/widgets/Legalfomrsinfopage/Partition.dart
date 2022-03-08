import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Partitionlegalforms extends StatefulWidget {
  Partitionlegalforms({Key? key}) : super(key: key);

  @override
  _PartitionlegalformsState createState() => _PartitionlegalformsState();
}

class _PartitionlegalformsState extends State<Partitionlegalforms> {
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
                translate!.forms11,
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
          body: partition(context)),
    );
  }

  partition(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> partitionLegalforms = [
      Legalformsdatamodel(
          title: translate!.partitionform1,
          url:
              "https://drive.google.com/file/d/1j5iFgQFb5ekJcMdG-joeSicdZosNkGGW/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform2,
          url:
              "https://drive.google.com/file/d/1n9XTGQPPfl08m0U-4KJ9jhhT4XtXTMRV/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform3,
          url:
              "https://drive.google.com/file/d/1YP9SluPMZyYkBeTYagWWbes0QUWK9iUM/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform4,
          url:
              "https://drive.google.com/file/d/1hI-ukx5Q6DukcHHJESf50au_HsuoXY9s/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform5,
          url:
              "https://drive.google.com/file/d/1tb59q2bZA_8S1FRBjWwUNQVja6BeUU7_/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partitionform6, url: ""),
      Legalformsdatamodel(
          title: translate.partitionform7,
          url:
              "https://drive.google.com/file/d/15Cb-8QjTDrO1dikc5xGuHqtM557wnjIo/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform8,
          url:
              "https://drive.google.com/file/d/1z44J8oyWKqphxF8uRk8SOR0S2VHGJRy3/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform9,
          url:
              "https://drive.google.com/file/d/1EPfBKdoVigViNc_rw2-HQUuWma8ctIVI/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform10,
          url:
              "https://drive.google.com/file/d/1QsbSdC9c9p7TyWREbjV2YlAzzQjcS1qZ/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.partitionform11,
          url:
              "https://drive.google.com/file/d/1FJP2dMsikgAo30s8utrRj6ywR2mhayaY/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: partitionLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye,),
              title: Text(
                partitionLegalforms[index].title,
                // style: demofont,
              ),
              onTap: ()=>{launch(partitionLegalforms[index].url)});
              // onTap: () {
              //   showDialog(
              //       context: context,
              //       builder: (context) => AlertDialog(
              //             backgroundColor: dialog,
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
