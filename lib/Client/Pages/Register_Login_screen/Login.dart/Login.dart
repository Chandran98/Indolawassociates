import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Sign_Up/Sign_Up.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/forgot_password/forgot_password.dart';
import 'package:indolawassociates/Client/constants/constant.dart';

import '../../../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  final loginemailcontroller = TextEditingController();
  final loginpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: navy,
        
        //   // title: Text(
        //   //   "Payment",
        //   //   style: GoogleFonts.mulish(
        //   //       color: white, fontWeight: FontWeight.w500, fontSize: 20),
        //   // ),
        //   leading: IconButton(
        //       onPressed: () => Navigator.pushReplacement(
        //           context, MaterialPageRoute(builder: (context) => Mainhome())),
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: white,
        //       )),
        // ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27.h,
              width: MediaQuery.of(context).size.width * 1.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/Login_image.jpg"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 200.h),
              child: Container(
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                height: MediaQuery.of(context).size.height * .7.h,
                width: MediaQuery.of(context).size.width * 1.w,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75.h,
                  width: MediaQuery.of(context).size.width * 1.w,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22))),
                  padding: EdgeInsets.all(30.h),
                  child: Form(
                    key: loginkey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          (TextFormField(
                              controller: loginemailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              validator: MultiValidator([
                                RequiredValidator(errorText: emailnull),
                                PatternValidator(
                                    (r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                                    errorText: invalidemail)
                              ]),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: navy,
                                  ),
                                  labelText: "Email",
                                  hintText: "Email",
                                  labelStyle: hStyle,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1))))),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02.h),
                          TextFormField(
                              controller: loginpasswordcontroller,
                              obscureText: true,
                              validator: MultiValidator([
                                RequiredValidator(errorText: passwordnull),
                                MinLengthValidator(6, errorText: passwordshort)
                              ]),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_lock,
                                    color: navy,
                                  ),
                                  labelText: "Password",
                                  hintText: "Password",
                                  labelStyle: hStyle,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1)))),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.0),
                          Container(
                            alignment: Alignment(1.0, 0.0),
                            padding: EdgeInsets.only(top: 15.0, left: 20.0),
                            child: InkWell(
                              onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Forgot())),
                              child: Text(
                                'Forgot Password ?',
                                style: GoogleFonts.mulish(
                                  fontSize: 14.sp,
                                  color: navy,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04.h),
                          Container(
                            height: MediaQuery.of(context).size.height * .06.h,
                            width: MediaQuery.of(context).size.width * .6.h,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: gold,
                              elevation: 7.0,
                              child: TextButton(
                                onPressed: () {
                                  if (loginkey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Mainhome()));
                                  }

                                  // sigin();
                                },
                                child: Center(
                                    child: Text('LOG-IN',
                                        style: GoogleFonts.mulish(
                                            fontWeight: FontWeight.w600,
                                            color: white,
                                            fontSize: 20.sp))),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),

                          /////// Google, fb login /////////

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100],
                                ),
                                child: IconButton(
                                  iconSize: 40,
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
                                  iconSize: 40,
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
                                  iconSize: 40,
                                  splashColor: Colors.white,
                                  color: Colors.white,
                                  icon: SvgPicture.asset(
                                      "assets/icons/twitter.svg"),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text("Don't have a account ?",
                                    style: GoogleFonts.mulish(
                                        fontSize: 15.sp, color: navy)),
                              ),
                              InkWell(
                                onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Sigin())),
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.mulish(
                                      fontSize: 15.sp,
                                      color: navy,
                                      fontWeight: FontWeight.bold,
                                      decorationThickness: 2,
                                      decorationColor: navy),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
