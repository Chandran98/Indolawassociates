import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../main.dart';

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
  final List<legalformsmodel> legalformlist = [
    legalformsmodel(legalformname: "Forms Related to Trust Agreements"),
    legalformsmodel(legalformname: "Forms Related to Will"),
    legalformsmodel(legalformname: "Forms Related to Company Laws"),
    legalformsmodel(legalformname: "Forms Related to Business"),
    legalformsmodel(legalformname: "Forms Related to Criminal Laws"),
    legalformsmodel(legalformname: "Forms Related to Deeds"),
    legalformsmodel(legalformname: "Forms Related to Family Laws"),
    legalformsmodel(legalformname: "Forms Related to Gifts"),
    legalformsmodel(legalformname: "Forms Related to Mortgage"),
    legalformsmodel(legalformname: "Forms Related to Partition"),
    legalformsmodel(legalformname: "Forms Related to Partnership"),
    legalformsmodel(legalformname: "Forms Related to Sales"),
  ];

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
        body: ListView.separated(
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
        ),
      );
    });
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
