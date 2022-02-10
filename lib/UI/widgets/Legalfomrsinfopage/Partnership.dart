import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Partnershiplegalforms extends StatefulWidget {
  Partnershiplegalforms({Key? key}) : super(key: key);

  @override
  _PartnershiplegalformsState createState() => _PartnershiplegalformsState();
}

class _PartnershiplegalformsState extends State<Partnershiplegalforms> {
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

    return WillPopScope(onWillPop: () {
      onback();
      return Future.value(false);
    }, child: Consumer<Languagenotifier>(
      builder: (_, provider, snapshot) {
        return Scaffold(
            appBar: AppBar(
              elevation: 3,
              toolbarHeight: 70,
              centerTitle: true,
              backgroundColor: dialog,
              title: FittedBox(
                child: Text(
                  translate!.forms12,
                  style: titletextwhite,
                  textAlign: TextAlign.center,
                ),
              ),
              leading: IconButton(
                  onPressed: () => Navigator.pushNamed(context, legalformroute),
                  icon: Image.asset(
                    "assets/icons/rback.png",
                    color: white,
                    height: 35,
                  )),
            ),
            body: partnership(context));
      },
    ));
  }

  partnership(context) {
    final translate = AppLocalizations.of(context);
    List<Legalformsdatamodel> partnership_legalforms = [
      Legalformsdatamodel(title: translate!.partnershipform1,url: "https://drive.google.com/file/d/1rhrzngRNLEXQsgGM99Vx2nVne5EoIABc/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform2, url: "https://drive.google.com/file/d/1mKg43_ikaqSUd1xfjXqt1pzKJLu_jNZ0/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform3, url: "https://drive.google.com/file/d/13edIHWizVcbIjfD6dduBHPmvBm5JoGSL/view?usp=sharing"),
      // Legalformsdatamodel(title:translate.partnershipform4, Url: ""),
      Legalformsdatamodel(title: translate.partnershipform4, url: ""),
      Legalformsdatamodel(title: translate.partnershipform5, url: "https://drive.google.com/file/d/1wDlalKwNfdbcDuvTo1rlnN77uiGzRmqI/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform6, url: "https://drive.google.com/file/d/1PWWjU7ZLnL4Tq_mDp0Wxj3LXKsFX_bT0/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform7, url: "https://drive.google.com/file/d/1qFyAPKvKCxmxU0enQ1oEBzVCj3KWabve/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform8, url: "https://drive.google.com/file/d/1rXu9zVj5o3yA20Qq1k18p4dQksoRaxxL/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform9, url: "https://drive.google.com/file/d/1OfDmphMlV_LgdOBBNgy5PU9bxE6dOWTk/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform10,url: "https://drive.google.com/file/d/11ic_Iw9VwiDG_-zCXfJZUmNSRhkMaP23/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform11,url: "https://drive.google.com/file/d/15AW3j7qqqyKdilUGY_HrUxcq-bXjyjZw/view?usp=sharing"),      // Legalformsdatamodel(title:translate.partnershipform12, Url: ""),

      Legalformsdatamodel(title: translate.partnershipform13, url: "https://drive.google.com/file/d/10lYUxf4SMbvVV4yZdcludiJ1qzUIZDMl/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform14, url: "https://drive.google.com/file/d/1U475VOCqcrauWs8spdmH9KaQAlz6bolu/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform15, url: "https://drive.google.com/file/d/1xB1gk9vGH6NduCzC8wD46m5p6n8UObyx/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform16, url: "https://drive.google.com/file/d/1quqkJzWPGsDCXyI_d6J9qxaFEQq6HP-A/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform17, url: "https://drive.google.com/file/d/1fBgTaiw_MRETbd1gGMpMyx2JR-OgK3Hc/view?usp=sharing"),
      Legalformsdatamodel(title: translate.partnershipform18, url: "https://drive.google.com/file/d/1-52zC5SrrXlL_7z41ZS_FtxpHOYnKcq4/view?usp=sharing"),
      Legalformsdatamodel(
          title:translate.partnershipform19, url: "https://drive.google.com/file/d/1e9B9jRi6uEi-ZIEl9YkvSE8yauSsLllm/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: partnership_legalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: black),
              title: Text(
                partnership_legalforms[index].title,
                style: demofont,
              ),
              onTap: ()=>{launch(partnership_legalforms[index].url)});
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
