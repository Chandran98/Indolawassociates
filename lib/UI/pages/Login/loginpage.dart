import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/clippath.dart';
import 'package:indolawassociates/UI/components/socialmedia.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
  void initState() {
    SmsAutoFill().listenForCode();

    Timer.run(() {
      if (_auth.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MainHomepage(),
          ),
          (route) => false,
        );
      }
    });
    _listenotp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? _otpscreen(context) : _loginscreen(context);
  }

  _loginscreen(context) {
    void onback() {
      SystemNavigator.pop();
    }

    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffF5F5F5),
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomdClipper(),
                    child: Container(
                      height: 250, width: double.infinity,
                      // width: 200
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          )
                        ],
                        color: white,
                        // borderRadius: BorderRadius.only(
                        //     bottomLeft: Radius.circular(20),
                        //     bottomRight: Radius.circular(20)
                        //     // bottom: Radius.elliptical(
                        //     //     MediaQuery.of(context).size.width * 1.w,
                        //     //     MediaQuery.of(context).size.height * 0.08.h)
                        //     ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35),
                            child: Image.asset(
                              "assets/icons/ilatri.png",
                              height: 80,
                            ),
                          ),
                          Image.asset(
                            "assets/icons/titleb.png",
                            height: 100,
                            width: 300,
                            color: black,
                          )
                        ],
                      ),
                    ),
                  ),
                  spaced10,
                  Text(
                    "Welcome Back!",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
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
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      initialCountryCode: 'IN',
                      controller: numberController,
                      onChanged: (phoneNumber) {
                        setState(() {
                          phone = phoneNumber.completeNumber;
                          // print(phone);
                        });
                      },
                    ),
                  ),
                  spaced10,
                  Container(
                      // margin: EdgeInsets.only(top: 40, bottom: 5),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: !isLoading
                              ? new TextButton(
                                  onPressed: () async {
                                    final otpcode =
                                        SmsAutoFill().getAppSignature;
                                    print(otpcode);
                                    if (!isLoading) {
                                      if (_formkey.currentState!.validate()) {
                                        displaySnackBar('Please wait...');
                                        await login();
                                      }
                                    }
                                    final signature =
                                        SmsAutoFill().getAppSignature;
                                    print(signature);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: white,
                                          border: Border.all(color: navy)),
                                      height: 50,
                                      width: 200,
                                      // padding: const EdgeInsets.symmetric(
                                      //   vertical: 15.0,
                                      //   horizontal: 15.0,
                                      // ),
                                      child: Center(
                                        child: Text(
                                          "Log-in",
                                          style: GoogleFonts.poppins(
                                              // fontWeight: FontWeight.bold,
                                              color: black,
                                              fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                )
                              : CircularProgressIndicator(
                                  // backgroundColor: Colors.white,
                                  color: green,
                                ))),
                  spaced30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text("New User ?",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: black)),
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
                  spaced10,
                  Socialmedia()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _otpscreen(context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
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
          backgroundColor: Color(0xffF5F5F5),
          key: _scaffoldKey,
          body: SingleChildScrollView(
            child: Form(
              key: _formKeyOTP,
              child: Column(
                children: [
                  ClipPath(
                    clipper: CustomdClipper(),
                    child: Container(
                      color: white,
                      height: 250, width: double.infinity,

                      // decoration: new BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.grey,
                      //       offset: Offset(0.0, 1.0), //(x,y)
                      //       blurRadius: 6.0,
                      //     )
                      //   ],
                      //   color: white,
                      //   borderRadius: BorderRadius.vertical(
                      //       bottom: Radius.elliptical(
                      //           width * 1.w,
                      //           height * 0.08.h)),
                      // ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Image.asset(
                              "assets/icons/ilatri.png",
                              height: 80,
                            ),
                          ),
                          Image.asset(
                            "assets/icons/titleb.png",
                            height: 100,
                            width: 300,
                            color: black,
                          ),
                          // TextButton(
                          //     onPressed: () => Navigator.pushReplacement(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => Mainhome())),
                          //     child: Text("data"))
                        ],
                      ),
                    ),
                  ),
                  spaced10,
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isLoading
                                ? "Verify your OTP"
                                : "The code has been sent to\n your mobile via SMS",
                            style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          spaced10,
                          // Container(color: gold,
                          //     child: Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //             vertical: 60.0, horizontal: 20.0),
                          //         child: Text(
                          //           !isLoading
                          //               ? "Verify Your OTP "
                          //               : "Verifying OTP code via SMS",
                          //           textAlign: TextAlign.center,
                          //           style: GoogleFonts.mulish(
                          //               fontSize: 20.sp,
                          //               color: navy,
                          //               fontWeight: FontWeight.bold),
                          //         ))),
                          !isLoading
                              ? Container(
                                  child: PinFieldAutoFill(
                                    decoration: UnderlineDecoration(
                                        colorBuilder: FixedColorBuilder(black)),
                                    codeLength: 6,
                                    onCodeChanged: (val) {
                                      if (val != null) {
                                        return otpcoder = val;
                                      } else {
                                        return Text("Please enter OTP");
                                      }

                                      // FocusScope.of(context)
                                      //     .requestFocus(FocusNode());
                                    },
                                    keyboardType: TextInputType.number,
                                    // autoFocus: true,
                                  ),
                                )
                              : Container(
                                  // color: navy,
                                  ),
                          !isLoading
                              ? Container(
                                  // margin: EdgeInsets.only(top: 40, bottom: 5),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0, vertical: 20),
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
                                                BorderRadius.circular(15),
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
                                              BorderRadius.circular(15),
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
                                                    // fontWeight:
                                                    //     FontWeight.bold,
                                                    color: black,
                                                    fontSize: 15))),
                                      ),
                                    ),
                                  ),
                                )
                              // Container(
                              //     margin: EdgeInsets.only(top: 20),
                              //     child: Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 10.0),
                              //         child: new TextButton(
                              //           onPressed: () async {
                              //             if (mounted)
                              //               setState(() {
                              //                 isResend = false;
                              //                 isLoading = true;
                              //               });
                              //             await login();
                              //           },
                              //           child: new Container(
                              //             width: width * .6.w,
                              //             height: height * .07.h,
                              //             child: Material(
                              //               borderRadius:
                              //                   BorderRadius.circular(20),
                              //               elevation: 4,
                              //               color: white,
                              //               child: Center(
                              //                   child: Text('Resend Code',
                              //                       style: GoogleFonts.mulish(
                              //                           fontWeight:
                              //                               FontWeight.bold,
                              //                           color: navy,
                              //                           fontSize: 20))),
                              //             ),
                              //           ),
                              //         )))

                              : Column(),
                          spaced20,
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
