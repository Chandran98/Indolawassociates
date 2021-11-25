import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

/////////////////////////////////////        Legal forms Data Model          /////////////////////////////////

class legalformsmodel {
  String legalformname;
  legalformsmodel({required this.legalformname});
}

///////////////////////////////////////////    Legal forms   //////////////////////////////////////////

class Legalforms extends StatefulWidget {
  const Legalforms({Key? key}) : super(key: key);

  @override
  _LegalformsState createState() => _LegalformsState();
}

class _LegalformsState extends State<Legalforms> {

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return Consumer(builder: (context, provider, snapshot) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: navy,
          title: Text(
            "Legal Forms",
            style: GoogleFonts.mulish(
                color: white, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mainhome())),
              icon: Icon(
                Icons.arrow_back,
                color: white,
              )),
        ),
        body:legalforms(context)
      );
    });
  }
  Widget legalforms(context){ 
    final translate = AppLocalizations.of(context);
      List<legalformsmodel> legalformlist = [
    legalformsmodel(legalformname: translate!.forms1),
    legalformsmodel(legalformname:  translate.forms2),
    legalformsmodel(legalformname: translate.forms3),
    legalformsmodel(legalformname: translate.forms4),
    legalformsmodel(legalformname: translate.forms5),
    legalformsmodel(legalformname: translate.forms6),
    legalformsmodel(legalformname: translate.forms7),
    legalformsmodel(legalformname: translate.forms8),
    legalformsmodel(legalformname: translate.forms9),
    legalformsmodel(legalformname: translate.forms10),
    legalformsmodel(legalformname: translate.forms11),
    legalformsmodel(legalformname: translate.forms12),
  ];
  return ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: legalformlist.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.logout, color: navy),
                title: Text(
                  legalformlist[index].legalformname,
                  style: hStyle,
                ),
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LegalservicesPage(
                            legalformname:
                                legalformlist[index].legalformname))));
          },
        );
}
}

////////////////////////////////    Legal forms Page      ////////////////////////////////

class LegalservicesPage extends StatelessWidget {
  const LegalservicesPage({Key? key, required this.legalformname})
      : super(key: key);

  final String legalformname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: navy,
        title: Text(legalformname,
            style: GoogleFonts.mulish(
                fontSize: 18.5, fontWeight: FontWeight.w500, color: white)),
        leading: IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Legalforms())),
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
