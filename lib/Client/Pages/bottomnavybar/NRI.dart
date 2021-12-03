import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../main.dart';

class NRI extends StatelessWidget {
  const NRI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
 void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

    return WillPopScope(  onWillPop: () {
        onback();
        return Future.value(false);
      },
      child:SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: navy,
            title: Text(
              translate!.navkey4,
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
        ),
      ),
    );
  }
}
