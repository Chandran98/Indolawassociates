import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Sign_Up/sign.dart';
import 'package:indolawassociates/main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../dummy/main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController numberController = new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isLoginScreen = true;
  var isOTPScreen = false;
  var verificationCode = '';
  late String phone;

  void initState() {
    Timer.run(() {
      if (_auth.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Mainhome(),
          ),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? returnOTPScreen() : loginpage();
  }

  Widget loginpage() {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            backgroundColor: navy,
            content: Text(
              'Tap back again to exit app.',
              style: TextStyle(fontSize: 18),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27.h,
                  width: MediaQuery.of(context).size.width * 1.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Login_image.jpg"),
                          fit: BoxFit.cover)),
                ),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01.h,
                            ),
                            Text(
                              "Welcome Back!",
                              style: GoogleFonts.mulish(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: navy),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: IntlPhoneField(
                                enabled: !isLoading,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your mobile no.';
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  // labelText: 'Phone Number',
                                  //  prefixIcon: Icon(
                                  //   Icons.phone,
                                  //   color: navy,
                                  // ),
                                  labelText: "Mobile no.",
                                  hintText: "Mobile ",
                                  labelStyle: hStyle,
                                  // border: OutlineInputBorder(
                                  //     borderSide: BorderSide())
                                ),
                                initialCountryCode: 'IN',
                                controller: numberController,
                                onChanged: (phoneNumber) {
                                  setState(() {
                                    phone = phoneNumber.completeNumber;
                                    print(phone);
                                  });
                                },
                              ),

                              // TextFormField(
                              //   enabled: !isLoading,
                              //   controller: numberController,
                              //   keyboardType: TextInputType.phone,
                              //   decoration: InputDecoration(
                              //       border: OutlineInputBorder(),
                              //       hintText: "Enter Your mobile no.",
                              //       labelText: "Mobile no.",
                              //       labelStyle: hStyle),
                              //   validator: MultiValidator([
                              //     RequiredValidator(errorText: phonenull),
                              //     MaxLengthValidator(10, errorText: loginphonenum),
                              //     MinLengthValidator(10, errorText: loginphonenum)
                              //   ]),
                              // ),
                            )),
                            Container(
                                margin: EdgeInsets.only(top: 40, bottom: 5),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: !isLoading
                                        ? new TextButton(
                                            onPressed: () async {
                                              if (!isLoading) {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  displaySnackBar(
                                                      'Please wait...');
                                                  await login();
                                                }
                                              }
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: gold,
                                                ),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.07.h,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.5.h,
                                                // padding: const EdgeInsets.symmetric(
                                                //   vertical: 15.0,
                                                //   horizontal: 15.0,
                                                // ),
                                                child: Center(
                                                  child: Text(
                                                    "Log In",
                                                    style: GoogleFonts.mulish(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: white,
                                                        fontSize: 20.sp),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                          )
                                        : CircularProgressIndicator(
                                            backgroundColor: Colors.red,
                                          ))),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.05.h),
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
                                          builder: (context) => SignUp())),
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
                                height: MediaQuery.of(context).size.height *
                                    0.02.h),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget returnOTPScreen() {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          body: DoubleBackToCloseApp(
            snackBar: const SnackBar(
              backgroundColor: navy,
              content: Text(
                'Tap back again to exit app.',
                style: TextStyle(fontSize: 18),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  Form(
                    key: _formKeyOTP,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 60.0, horizontal: 20.0),
                                child: Text(
                                  !isLoading
                                      ? "Verify Your OTP "
                                      : "Sending OTP code via SMS",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.mulish(
                                      fontSize: 20,
                                      color: navy,
                                      fontWeight: FontWeight.bold),
                                ))),
                        !isLoading
                            ? Container(
                                child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                child: TextFormField(
                                  enabled: !isLoading,
                                  controller: otpController,
                                  keyboardType: TextInputType.number,
                                  // inputFormatters: <TextInputFormatter>[
                                  //   FilteringTextInputFormatter.digitsOnly
                                  // ],
                                  initialValue: null,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      labelText: 'OTP',
                                      labelStyle: GoogleFonts.mulish(
                                          fontSize: 18,
                                          color: navy,
                                          fontWeight: FontWeight.bold)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter OTP';
                                    }
                                  },
                                ),
                              ))
                            : Container(),
                        !isLoading
                            ? Container(
                                margin: EdgeInsets.only(top: 40, bottom: 5),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: new TextButton(
                                      onPressed: () async {
                                        if (_formKeyOTP.currentState!
                                            .validate()) {
                                          if (mounted)
                                            setState(() {
                                              isResend = false;
                                              isLoading = true;
                                            });
                                          try {
                                            await _auth
                                                .signInWithCredential(
                                                    PhoneAuthProvider.credential(
                                                        verificationId:
                                                            verificationCode,
                                                        smsCode: otpController
                                                            .text
                                                            .toString()))
                                                .then((user) async => {
                                                      if (user != null)
                                                        {
                                                          if (mounted)
                                                            setState(() {
                                                              isLoading = false;
                                                              isResend = false;
                                                            }),
                                                          Navigator
                                                              .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  Mainhome(),
                                                            ),
                                                            (route) => false,
                                                          )
                                                        }
                                                    })
                                                .catchError((error) => {
                                                      if (mounted)
                                                        setState(() {
                                                          isLoading = false;
                                                          isResend = true;
                                                        }),
                                                    });
                                            if (mounted)
                                              setState(() {
                                                isLoading = true;
                                              });
                                          } catch (e) {
                                            if (mounted)
                                              setState(() {
                                                isLoading = false;
                                              });
                                          }
                                        }
                                      },
                                      child: new Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .07,
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          elevation: 4,
                                          color: gold,
                                          child: Center(
                                              child: Text('Submit',
                                                  style: GoogleFonts.mulish(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: white,
                                                      fontSize: 20))),
                                        ),
                                      ),
                                    )))
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircularProgressIndicator(
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                        )
                                      ].where((c) => c != null).toList(),
                                    )
                                  ]),
                        isResend
                            ? Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: new TextButton(
                                      onPressed: () async {
                                        if (mounted)
                                          setState(() {
                                            isResend = false;
                                            isLoading = true;
                                          });
                                        await login();
                                      },
                                      child: new Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .07,
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          elevation: 4,
                                          color: white,
                                          child: Center(
                                              child: Text('Resend Code',
                                                  style: GoogleFonts.mulish(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: navy,
                                                      fontSize: 20))),
                                        ),
                                      ),
                                    )))
                            : Column()
                      ],
                    ),
                  )
                ]),
              ),
            ),
          )),
    );
  }

  displaySnackBar(text) {
    final snackBar = SnackBar(content: Text(text));
    _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  Future login() async {
    if (mounted)
      setState(() {
        isLoading = true;
      });

    // var phoneNumber = numberController.text.trim();
    var phoneNumber = phone;

    var isValidUser = false;
    // var number = numberController.text.trim();
    var number = phone;

    await _firestore
        .collection('ILA')
        .where('cellnumber', isEqualTo: number)
        .get()
        .then((result) {
      if (result.docs.length > 0) {
        isValidUser = true;
      }
    });

    if (isValidUser) {
      var verifyPhoneNumber = _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) {
          _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
                if (user != null)
                  {
                    if (mounted)
                      {
                        setState(() {
                          isLoading = false;
                          isOTPScreen = false;
                        }),
                      },
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Mainhome(),
                      ),
                      (route) => false,
                    )
                  }
              });
        },
        verificationFailed: (FirebaseAuthException error) {
          displaySnackBar('Validation error, please try again later');
          if (mounted)
            setState(() {
              isLoading = false;
            });
        },
        codeSent: (verificationId, [forceResendingToken]) {
          if (mounted)
            setState(() {
              isLoading = false;
              verificationCode = verificationId;

              isOTPScreen = true;
            });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (mounted)
            setState(() {
              isLoading = false;

              verificationCode = verificationId;
            });
        },
        timeout: Duration(seconds: 60),
      );
      await verifyPhoneNumber;
    } else {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      displaySnackBar('Number not found, please sign up first');
    }
  }
}
