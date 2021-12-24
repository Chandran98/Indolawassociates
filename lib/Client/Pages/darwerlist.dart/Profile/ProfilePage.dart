import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = "";
  String _mobilenumber = "";
  String _email = "";
  String _location = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }
  
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Maindrawer()));
  }


  @override
  Widget build(BuildContext context) {
        final translate = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },      child: Scaffold(
        appBar: AppBar(
          title: Text(translate!.drawerkey1
            ,
            style: GoogleFonts.mulish(
              fontSize: 21.sp,
              letterSpacing: 1.5,
              color: white,
              fontWeight: FontWeight.w600,
            ),
          ),
          elevation: 0.0,
          backgroundColor: navy,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Maindrawer())),
          ),
        ),
        body: Column(
          children: [
            Container(
                margin:EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 15),
                height: MediaQuery.of(context).size.height * 0.06.h,
                width: MediaQuery.of(context).size.height * 0.45.w,
                child: textfield(details: _username,icons: Icon(Icons.person,color: navy,))),
            Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
                height: MediaQuery.of(context).size.height * 0.06.h,
                width: MediaQuery.of(context).size.height * 0.45.w,
                child: textfield(details: _mobilenumber,icons: Icon(Icons.phone,color: navy))),
            Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 15),
                height: MediaQuery.of(context).size.height * 0.06.h,
                width: MediaQuery.of(context).size.height * 0.45.w,
                child: textfield(details: _email,icons: Icon(Icons.email,color: navy))),
            Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                height: MediaQuery.of(context).size.height * 0.06.h,
                width: MediaQuery.of(context).size.height * 0.45.w,
                child: textfield(details: _location, icons: Icon(Icons.location_on_outlined))),
          ],
        ),
      ),
    );
  }

  Widget textfield({@required details ,@required icons}) {
    return Material(
        elevation: 4,
        shadowColor: navy,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: icons,
            ),
            SizedBox(
              width: 20.w,
            ),
            Center(
                child: Text(
              details,
              style: hStyle,
            )),
          ],
        )
        // TextField(
        //   // controller: controller,
        //   decoration: InputDecoration(
        //       // labelText: labeltext,
        //       labelStyle: TextStyle(color: navy),
        //       hintText: hintText,
        //       hintStyle: TextStyle(
        //         color: navy,
        //         fontWeight: FontWeight.w300,
        //       ),
        //       fillColor: Colors.white30,
        //       filled: true,
        //       border: OutlineInputBorder(
        //           borderRadius: BorderRadius.circular(10.0),
        //           borderSide: BorderSide.none)),
        // ),
        );
  }

  Future<void> getuser() async {
    FirebaseFirestore.instance
        .collection("ILA")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
    if(mounted
    )  setState(() {
        _username = value.data()!["name"].toString();
        _email = value.data()!["email"].toString();
        _location = value.data()!["location"].toString();
        _mobilenumber = value.data()!["cellnumber"].toString();
      });
    });
  }
}
