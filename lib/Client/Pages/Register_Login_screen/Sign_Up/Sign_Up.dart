import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login.dart/Login.dart';
import 'package:indolawassociates/Client/constants/constant.dart';


class Sigin extends StatefulWidget {
  const Sigin({Key? key}) : super(key: key);

  @override
  _SiginState createState() => _SiginState();
}

class _SiginState extends State<Sigin> {
  final emailcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final locationcontroller = TextEditingController();

  String password = '';
  bool ispasswordvisible = false;
  GlobalKey<FormState> signupkey = GlobalKey<FormState>();
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: 
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25, top: 30),
                child: Form(
                  key: signupkey,
                  child: Column(
                    children: [
                      Text(
                        "Register Account",
                        style: GoogleFonts.mulish(
                            color: navy,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Complete your details or continue with social media",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mulish(fontSize: 18.sp, color: navy),
                        ),
                      ),  TextFormField(
                         validator: MultiValidator([
                    RequiredValidator(errorText: usernamenull),
                  ]),
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: mobilecontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: navy,
                            ),
                            labelText: "User name",
                            hintText: "User name",
                            labelStyle:hStyle
                            ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          RequiredValidator(errorText: emailnull),
                          PatternValidator(
                              (r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                              errorText: invalidemail)
                        ]),
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail, color: navy),
                            labelText: "Email",
                            alignLabelWithHint: true,
                            hintText: "Email",
                            labelStyle:hStyle),
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          MaxLengthValidator(10, errorText: phonenummax),
                          MinLengthValidator(10, errorText: phonenummin)
                        ]),
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: mobilecontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: navy,
                            ),
                            labelText: "Mobile no.",
                            hintText: "Mobile ",
                            labelStyle:hStyle),
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: addressnull),
                        ]),
                        keyboardType: TextInputType.streetAddress,
                        controller: locationcontroller,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_pin,
                              color: navy,
                            ),
                            labelText: "location",
                            hintText: "location",
                            labelStyle:hStyle),
                      ),
                      // TextFormField(
                      //   validator: MultiValidator([
                      //     RequiredValidator(errorText: passwordnull),
                      //     MinLengthValidator(6, errorText: passwordshort)
                      //   ]),
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(
                      //         Icons.vpn_lock,
                      //         color: navy,
                      //       ),
                      //       suffixIcon: IconButton(
                      //           color: TextColor,
                      //           onPressed: () => ispasswordvisible,
                      //           icon: ispasswordvisible
                      //               ? Icon(
                      //                   Icons.remove_red_eye,
                      //                   color: navy,
                      //                 )
                      //               : Icon(
                      //                   Icons.visibility_off,
                      //                   color: navy,
                      //                 )),
                      //       labelText: "Password",
                      //       labelStyle: GoogleFonts.mulish(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold,
                      //         color: navy,
                      //       ),
                      //       hintText: "eg. sndfuej@45"),
                      //   obscureText: true,
                      // ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05.h,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * .06.h,
                          width: MediaQuery.of(context).size.width * .6.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: gold,
                            elevation: 4.0,
                            child: TextButton(
                              onPressed: () {
                                if (signupkey.currentState!.validate()) {}
                              },
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.mulish(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02.h,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * .06.h,
                          width: MediaQuery.of(context).size.width * .6.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: white,
                            elevation: 4.0,
                            child: TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage())),
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: GoogleFonts.mulish(
                                    fontSize: 18.sp,
                                    color: navy,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                            child: IconButton(
                              iconSize: 40.r,
                              splashColor: navy,
                              color: navy,
                              icon: SvgPicture.asset(
                                  "assets/icons/facebook-2.svg"),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                            child: IconButton(
                              iconSize: 40.r,
                              splashColor: navy,
                              color: navy,
                              icon: SvgPicture.asset(
                                "assets/icons/google-icon.svg",
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[100],
                            ),
                            child: IconButton(
                              iconSize: 40.r,
                              splashColor: Colors.white,
                              color: Colors.white,
                              icon:
                                  SvgPicture.asset("assets/icons/twitter.svg"),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01.h,
                      ),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.mulish(color: navy, fontSize: 15.sp),
                      ) ,SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
