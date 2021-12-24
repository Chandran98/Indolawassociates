import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/APi/sharedpreferences.dart';
import 'package:indolawassociates/Client/Pages/Homepage/drawer.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/Profile_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profilestorage = Profilestorage();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _address1Controller = TextEditingController();
  final _address2Controller = TextEditingController();

  final _phoneController = TextEditingController();
//
//
// final _genderController=TextEditingController();

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Maindrawer()));
  }

  @override
  void initState() {
    super.initState();
    updateprofile();
  }

  Future updateprofile() async {
    final read = await _profilestorage.getprofile();

    setState(() {
      _usernameController.text = read.username;
      _address1Controller.text = read.address1;
      _address2Controller.text = read.address2;

      _emailController.text = read.email;
      _phoneController.text = read.phone;
    });
  }

  void _update() {
    final saveprofile = Profile(
        username: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address1: _address1Controller.text,
        address2: _address2Controller.text);

    _profilestorage.saveprofile(saveprofile);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Updated",style: GoogleFonts.mulish(fontSize: 15.sp),textAlign: TextAlign.center,),
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal:100 ,vertical:100 ),
    ));
  }

  @override
  Widget build(BuildContext context) {    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            translate!.drawerkey1,
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // CustomPaint(
              //   child:
              //  Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.25,
              //   child: Center(
              //     child: Text(
              //       "Profile",
              //       style: GoogleFonts.mulish(
              //         fontSize: 35,
              //         letterSpacing: 1.5,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ),
              // ),
              // painter: HeaderCurvedContainer(),
              // ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textfield(
                        hintText: 'Username',
                        controller: _usernameController,
                        labeltext: "Username"),
                    // textfield(
                    //   hintText: 'Gender',controller: _emailController
                    // ),
                    textfield(
                        hintText: 'Email',
                        controller: _emailController,
                        labeltext: "Email"),
                    textfield(
                        hintText: 'Address 1',
                        controller: _address1Controller,
                        labeltext: "Address 1"),
                    textfield(
                        hintText: 'Address 2',
                        controller: _address2Controller,
                        labeltext: "Address 2"),
                    textfield(
                        hintText: 'Phone no.',
                        controller: _phoneController,
                        labeltext: "Phone no."),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      width: MediaQuery.of(context).size.width * 0.45.w,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: (_update),
                        color: gold,
                        child: Center(
                          child: Text(
                            "Update",
                            style: GoogleFonts.mulish(
                              fontSize: 23.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textfield(
      {@required hintText, @required controller, @required labeltext}) {
    return Material(
      elevation: 4,
      shadowColor: navy,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            labelText: labeltext,
            labelStyle: TextStyle(color: navy),
            hintText: hintText,
            hintStyle: TextStyle(
              color: navy,
              fontWeight: FontWeight.w300,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }
}

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = navy;
//     Path path = Path()
//       ..relativeLineTo(0, 150)
//       ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
//       ..relativeLineTo(0, -150)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
