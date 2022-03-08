import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/Internet%20connectivity/Network_status.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Servicepage/Paralegal/paralegalinfopage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

/////////////////////////////////////        Legal forms Data Model          /////////////////////////////////

class Paramodel {
  String Paralegaltitle, paralegalcontent;
  Color color;
  Paramodel(
      {required this.Paralegaltitle,
      required this.color,
      required this.paralegalcontent});
}

///////////////////////////////////////////    Legal forms   //////////////////////////////////////////

class TParalegal extends StatefulWidget {
  const TParalegal({Key? key}) : super(key: key);

  @override
  _TParalegalState createState() => _TParalegalState();
}

class _TParalegalState extends State<TParalegal> {
  void onback() {
    Navigator.pushNamed(context, homeroute);
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            // backgroundColor: white,
            // appBar: AppBar(
            //   elevation: 3,
            //   toolbarHeight: 60.h,
            //   centerTitle: true,
            //   backgroundColor: dialog,
            //   title: Text(
            //     translate!.paralegalservices,
            //     style: GoogleFonts.poppins(
            //         color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
            //   ),
            //   leading: IconButton(
            //       onPressed: () => Navigator.pushNamed(context,homeroute),
            //       icon: Image.asset(
            //         "assets/icons/rback.png",
            //         color: white,
            //         height: 35,
            //       )),
            // ),
            body: NetworkSensitive(child: paralegallist(context))),
      ),
    );

    // Widget op()
  }

  Widget paralegallist(context) {
    final translate = AppLocalizations.of(context);

    final List<Paramodel> paralegallist = [
      Paramodel(
          Paralegaltitle: translate!.paralegal1,
          paralegalcontent: translate.paralegalsub1,
          color: Color.fromARGB(255, 247, 11, 121)),
      Paramodel(
          Paralegaltitle: translate.paralegal2,
          paralegalcontent: translate.paralegalsub2,
          color: Colors.tealAccent),
      Paramodel(
          Paralegaltitle: translate.paralegal3,
          paralegalcontent: translate.paralegalsub3,
          color: Color(0xff8576FC)),
      Paramodel(
          Paralegaltitle: translate.paralegal4,
          paralegalcontent: translate.paralegalsub4,
          color: Color(0xff3D89D5)),
      // Paramodel(Paralegaltitle: " Legal Notice", paralegalcontent: ''),
      Paramodel(
          Paralegaltitle: translate.paralegal5,
          paralegalcontent: translate.paralegalsub5,
          color: appcolor2),
      Paramodel(
          Paralegaltitle: translate.paralegal6,
          paralegalcontent: translate.paralegalsub6,
          color: Color(0xffEB432F)),
      Paramodel(
          Paralegaltitle: translate.paralegal7,
          paralegalcontent: translate.paralegalsub7,
          color: Color(0xff71C9D3)),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        // separatorBuilder: (context, index) {
        //   return Divider();
        // },
        itemCount: paralegallist.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Paralegalscreen(
                        Paralegaltitle: paralegallist[index].Paralegaltitle,
                        paralegalcontent:
                            paralegallist[index].paralegalcontent))),
            child: Card(
              child: Container(
                color: paralegallist[index].color,
                child: Center(
                  child: Text(
                    paralegallist[index].Paralegaltitle,
                    style: GoogleFonts.poppins(color: white,fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.center,
                  ),
                ),
                height: 100,
                width: 150,
              ),
            ),
          );
        },
      ),
    );
  }
}

////////////////////////////////    Legal forms Page      ////////////////////////////////

// Future<FormModel> submitdata(
//     String name, gender, email, address, mobile, service) async {
//   final response = await http
//       .post(Uri.parse("http://api.indolawassociates.com/api/form"), body: {
//     "name": name,
//     "gender": gender,
//     "email": email,
//     "address": address,
//     "mobile": mobile,
//     "service": service,
//   });
//   var data = response.body;
//   return formModelFromJson(data);

//   // if (response.statusCode == 201) {
//   //   final  data = response.body;
//   //   return formModelFromJson(data);
//   // } else {
//   //   return null;
//   // }
// }


