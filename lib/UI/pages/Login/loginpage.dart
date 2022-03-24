import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/clippath.dart';
import 'package:indolawassociates/UI/components/socialmedia.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:indolawassociates/UI/themes/themes.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formkey = GlobalKey<FormState>();
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
  late String otpcoder;

  void _listenotp() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? _otpscreen() : _loginscreen();
  }

  _loginscreen() {
    void onback() {
      SystemNavigator.pop();
    }

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomdClipper(),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: new BoxDecoration(
                        color: context.watch<Themeprovider>().darktheme == false
                            ? white
                            : black,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Image.asset(
                              "assets/icons/ilatri.png",
                              height: 100,
                            ),
                          ),
                          // Image.asset(
                          //   "assets/icons/titleb.png",
                          //   height: 100,
                          //   width: 300,
                          // )
                        ],
                      ),
                    ),
                  ),
                  spaced10,
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  spaced10,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 30.0),
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
                        labelText: "Mobile no.",
                        hintText: "Mobile ",
                        labelStyle: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      initialCountryCode: 'IN',
                      controller: numberController,
                      onChanged: (phoneNumber) {
                        setState(() {
                          phone = phoneNumber.completeNumber;
                        });
                      },
                    ),
                  ),
                  spaced10,
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: !isLoading
                          ? new InkWell(
                              onTap: () async {
                                final otpcode = SmsAutoFill().getAppSignature;
                                print(otpcode);
                                if (!isLoading) {
                                  if (_formkey.currentState!.validate()) {
                                    displaySnackBar('Please wait...');
                                    await login();
                                  }
                                }
                                final signature = SmsAutoFill().getAppSignature;
                                print(signature);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: navy)),
                                  height: 50,
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      "Log-in",
                                      style: GoogleFonts.poppins(
                                          fontSize: 16, color: black),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            )
                          : CircularProgressIndicator(
                              color: green,
                            )),
                  spaced30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text("New User ?",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            )),
                      ),
                      spaced20,
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, signuproute),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.mulish(
                              fontSize: 16,
                              color: Color(0xff5770B5),
                              fontWeight: FontWeight.bold,
                              decorationThickness: 2,
                              decorationColor: navy),
                        ),
                      )
                    ],
                  ),
                  // SizedBox(height: height * 0.02.h),
                  spaced30, spaced30,
                  Socialmedia()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _otpscreen() {
    void onback() {
      Navigator.pushNamed(context, loginpageroute);
    }

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: _formKeyOTP,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomdClipper(),
                    child: Container(
                      decoration: new BoxDecoration(
                          color:
                              context.watch<Themeprovider>().darktheme == false
                                  ? white
                                  : black),
                      height: 250,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              "assets/icons/ilatri.png",
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaced10,
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isLoading
                                ? "Verify your OTP"
                                : "The code has been sent to\n your mobile via SMS",
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          spaced10,
                          !isLoading
                              ? Container(
                                  child: PinFieldAutoFill(
                                    decoration: UnderlineDecoration(
                                        colorBuilder: FixedColorBuilder(context
                                                    .watch<Themeprovider>()
                                                    .darktheme ==
                                                false
                                            ? black
                                            : white)),
                                    codeLength: 6,
                                    onCodeChanged: (val) {
                                      if (val != null) {
                                        return otpcoder = val;
                                      } else {
                                        return Text("Please enter OTP");
                                      }
                                    },
                                    keyboardType: TextInputType.number,
                                  ),
                                )
                              : Container(),
                          !isLoading
                              ? Container(
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
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
                                                          smsCode: otpcoder
                                                              .toString()))
                                                  .then((user) async => {
                                                        if (user != null)
                                                          {
                                                            if (mounted)
                                                              setState(() {
                                                                isLoading =
                                                                    false;
                                                                isResend =
                                                                    false;
                                                              }),
                                                            Navigator
                                                                .pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    MainHomepage(),
                                                              ),
                                                              (route) => false,
                                                            )
                                                          }
                                                      })
                                                  // ignore: invalid_return_type_for_catch_error
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
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: white,
                                              border: Border.all(color: navy)),
                                          height: 50,
                                          width: 200,
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            elevation: 4,
                                            color: white,
                                            child: Center(
                                                child: Text('Submit',
                                                    style: GoogleFonts.poppins(
                                                        // fontWeight:
                                                        //     FontWeight.bold,
                                                        color: black,
                                                        fontSize: 16))),
                                          ),
                                        ),
                                      )))
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                      // Text("data"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          CircularProgressIndicator(
                                            color: green,
                                          )
                                        ].where((c) => c != null).toList(),
                                      )
                                    ]),
                          isResend
                              ? TextButton(
                                  onPressed: () async {
                                    if (mounted)
                                      setState(() {
                                        isResend = false;
                                        isLoading = true;
                                      });
                                    await login();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: white,
                                          border: Border.all(color: navy)),
                                      height: 50,
                                      width: 200,
                                      child: Material(
                                        borderRadius: BorderRadius.circular(15),
                                        elevation: 4,
                                        color: white,
                                        child: Center(
                                            child: Text('Resend code',
                                                style: GoogleFonts.poppins(
                                                    color: black,
                                                    fontSize: 15))),
                                      ),
                                    ),
                                  ),
                                )
                              : Column(),
                          spaced30,
                          spaced30,
                          Socialmedia()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
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
                        builder: (BuildContext context) => MainHomepage(),
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
