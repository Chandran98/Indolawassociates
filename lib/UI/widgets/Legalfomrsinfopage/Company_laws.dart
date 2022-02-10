import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/models/Legalforms_data_models.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Companylegalforms extends StatefulWidget {
  Companylegalforms({Key? key}) : super(key: key);

  @override
  _CompanylegalformsState createState() => _CompanylegalformsState();
}

class _CompanylegalformsState extends State<Companylegalforms> {
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
            elevation: 3,
            toolbarHeight: 70,
            centerTitle: true,
            backgroundColor: dialog,
            title: FittedBox(
              child: Text(
                translate!.forms4,
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
          body: company(context)),
    );
  }

  company(context) {
    final translate = AppLocalizations.of(context);

    List<Legalformsdatamodel> companyLegalforms = [
      Legalformsdatamodel(
          title: translate!.companyform1,
          url:
              "https://drive.google.com/file/d/1Hz6p0ujgZiTV2oQTYMV4aHL3Eoul4uKa/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.companyform2,
          url:
              "https://drive.google.com/file/d/15BEcBJS06EuiAnfz5vKLWgDfs2hqpfTA/view?usp=sharing"),
      Legalformsdatamodel(
          title: translate.companyform3,
          url:
              "https://drive.google.com/file/d/1EeGHbTuMKMnq4w-H8NgkHV0CL4BKVGQO/view?usp=sharing"),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: companyLegalforms.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Icon(Icons.remove_red_eye, color: black),
              title: Text(
                companyLegalforms[index].title,
                style: demofont,
              ),
              // onTap: ()=>{launch(legalforms[index].url)});
              onTap: () {
            
                launch(companyLegalforms[index].url);  });
        },
      ),
    );
  }
}
