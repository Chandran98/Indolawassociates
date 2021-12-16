import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/components/clippath.dart';
import 'package:indolawassociates/UI/components/socialmedia.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Login/loginpage.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Demosignup extends StatefulWidget {
  Demosignup({Key? key}) : super(key: key);

  @override
  _DemosignupState createState() => _DemosignupState();
}

class _DemosignupState extends State<Demosignup> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController cellnumberController =
      new TextEditingController();
  // final TextEditingController otpController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';
  late String phone;
  late String otpcoder;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    cellnumberController.dispose();
    // otpController.dispose();
    locationController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void onback() {
    Navigator.pushNamed(context, loginpageroute);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final node = FocusScope.of(context);

    return isOTPScreen ? otpscreenpage() : signupscreen();
  }

  signupscreen() {
    void onback() {
    Navigator.pushNamed(context, loginpageroute);
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final node = FocusScope.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: CustomdClipper(),
                  child: Container(
                    color: white,
                    height: height * 0.25.h,
                    width: double.infinity,
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
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset(
                            "assets/icons/ilatri.png",
                            height: height * 0.06,
                          ),
                        ),
                        Image.asset(
                          "assets/icons/titleb.png",
                          height: height * 0.065,
                          width: width * 0.7.w,
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
                // SizedBox(
                //   height: height * 0.01.h,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Become a part of ILA",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: height * 0.01.h,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10.0),
                                child: TextFormField(
                                  enabled: !isLoading,
                                  controller: nameController,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  decoration: InputDecoration(
                                      // floatingLabelBehavior:
                                      //     FloatingLabelBehavior.never,
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: navy,
                                      ),
                                      labelText: "User name",
                                      hintText: "User name",
                                      labelStyle: demofont),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                  },
                                ),
                              )),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
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
                                  // controller: cellnumberController,
                                  onChanged: (phoneNumber) {
                                    setState(() {
                                      phone = phoneNumber.completeNumber;
                                      print(phone);
                                    });
                                  },
                                ),
                              )),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  enabled: !isLoading,
                                  keyboardType: TextInputType.streetAddress,
                                  controller: locationController,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (_) => node.unfocus(),
                                  decoration: InputDecoration(
                                      // floatingLabelBehavior:
                                      //     FloatingLabelBehavior.never,
                                      prefixIcon: Icon(
                                        Icons.location_pin,
                                        color: navy,
                                      ),
                                      labelText: "Location",
                                      hintText: "Location",
                                      labelStyle: hStyle),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: addressnull),
                                  ]),
                                ),
                              )),
                              Container(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  enabled: !isLoading,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (_) => node.unfocus(),
                                  decoration: InputDecoration(
                                      // floatingLabelBehavior:
                                      //     FloatingLabelBehavior.never,
                                      prefixIcon: Icon(Icons.mail, color: navy),
                                      labelText: "Email",
                                      // alignLabelWithHint: true,
                                      hintText: "Email",
                                      labelStyle: hStyle),
                                  validator: MultiValidator([
                                    RequiredValidator(errorText: emailnull),
                                    PatternValidator(
                                        (r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                                        errorText: invalidemail)
                                  ]),
                                ),
                              )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.005.h,
                              ),
                              Row(
                                children: [
                                  Text("Already a user?"),
                                  TextButton(
                                      onPressed: () {
    Navigator.pushNamed(context, loginpageroute);
                                      },
                                      child: Text(
                                        "Log in",
                                        style: demofont,
                                      ))
                                ],
                              ),
                              // SizedBox(
                              //   height:
                              //       MediaQuery.of(context).size.height * 0.02.h,
                              // ),
                              TextButton(
                                onPressed: () {
                                  if (!isLoading) {
                                    if (_formKey.currentState!.validate()) {
                                      if (mounted) {
                                        setState(() {
                                          signUp();
                                          isRegister = false;
                                          isOTPScreen = true;
                                        });
                                      }
                                    }
                                  }
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: white,
                                        border: Border.all(color: navy)),
                                    height: height * 0.06.h,
                                    width: width * 0.7.w,
                                    // padding: const EdgeInsets.symmetric(
                                    //   vertical: 15.0,
                                    //   horizontal: 15.0,
                                    // ),
                                    child: Center(
                                      child: Text(
                                        "Sign up",
                                        style: demofont,
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01.h,
                              ),
                              Text(
                                'By continuing your confirm that you agree \nwith our Term and Condition',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    color: black, fontSize: 12.sp),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01.h,
                              ),
                              Socialmedia()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  otpscreenpage() {
    void onback() {
    Navigator.pushNamed(context, signuproute);
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
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
              child: Column(children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Container(
                //         child: IconButton(
                //             iconSize: 40,
                //             color: white,
                //             icon: SvgPicture.asset(
                //               "assets/icons/back.svg",
                //               color: navy,
                //             ),
                //             onPressed: () => Navigator.pushReplacement(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => signupscreen()))),
                //       ),
                //       // Container(
                //       //   child: IconButton(
                //       //     iconSize: 20,
                //       //     color: white,
                //       //     icon: SvgPicture.asset(
                //       //       "assets/icons/3dots.svg",
                //       //       color: navy,
                //       //     ),
                //       //     onPressed: () {},
                //       //   ),
                //       // ),
                //     ],
                //   ),
                // ),
                Center(
                  child: Form(
                    key: _formKeyOTP,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipPath(
                          clipper: CustomdClipper(),
                          child: Container(
                            color: white,
                            height: height * 0.28.h,
                            width: double.infinity,
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
                                    height: height * 0.08,
                                  ),
                                ),
                                Image.asset(
                                  "assets/icons/titleb.png",
                                  height: height * 0.08,
                                  width: width * 0.7.w,
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
                        SizedBox(
                          height: height * 0.006.h,
                        ),
                        Text(
                          isLoading
                              ? "Verifying your OTP"
                              : "The code has been sent to\n +91 7448954986",
                          style: GoogleFonts.poppins(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: height * 0.02.h,
                        ),
                        // Container(
                        //     child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             vertical: 60.0, horizontal: 50.0),
                        //         child: Center(
                        //           child: Text(
                        //             !isLoading
                        //                 ? "Verify Your OTP "
                        //                 : "Verifying OTP code via SMS",
                        //             textAlign: TextAlign.center,
                        //             style: GoogleFonts.mulish(
                        //                 fontSize: 20,
                        //                 color: navy,
                        //                 fontWeight: FontWeight.bold),
                        //           ),
                        //         ))),

                        !isLoading
                            ? Container(
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                child: PinFieldAutoFill(
                                  decoration: UnderlineDecoration(
                                      colorBuilder: FixedColorBuilder(black)),
                                  codeLength: 6,
                                  onCodeChanged: (val) {
                                    otpcoder = val!;
                                    // FocusScope.of(context)
                                    //     .requestFocus(FocusNode());
                                  },
                                  keyboardType: TextInputType.number,
                                  // autoFocus: true,
                                ),
                                //    Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //       vertical: 1.0, horizontal: 10.0),
                                //   child: TextFormField(
                                //     enabled: !isLoading,
                                //     controller: otpController,
                                //     keyboardType: TextInputType.number,
                                //     // inputFormatters: <TextInputFormatter>[
                                //     //   FilteringTextInputFormatter.digitsOnly
                                //     // ],
                                //     initialValue: null,
                                //     autofocus: true,
                                //     decoration: InputDecoration(
                                //         labelText: 'OTP',
                                //         labelStyle: GoogleFonts.mulish(
                                //             fontSize: 18,
                                //             color: navy,
                                //             fontWeight: FontWeight.bold)),
                                //     validator: (value) {
                                //       if (value!.isEmpty) {
                                //         return 'Please enter OTP';
                                //       }
                                //     },
                                //   ),
                                // ),
                              )
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
                                          if (mounted) {
                                            setState(() {
                                              isResend = false;
                                              isLoading = true;
                                            });
                                          }
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
                                                          await _firestore
                                                              .collection('ILA')
                                                              .doc(_auth
                                                                  .currentUser!
                                                                  .uid)
                                                              .set(
                                                                  {
                                                                'name':
                                                                    nameController
                                                                        .text
                                                                        .trim(),
                                                                'cellnumber':
                                                                    phone
                                                                        .trim(),
                                                                'location':
                                                                    locationController
                                                                        .text
                                                                        .trim(),
                                                                'email':
                                                                    emailController
                                                                        .text
                                                                        .trim(),
                                                              },
                                                                  SetOptions(
                                                                      merge:
                                                                          true)).then(
                                                                  (value) => {
                                                                        //then move to authorised area
                                                                        setState(
                                                                            () {
                                                                          isLoading =
                                                                              false;
                                                                          isResend =
                                                                              false;
                                                                        })
                                                                      }),
                                                          if (mounted)
                                                            {
                                                              setState(() {
                                                                isLoading =
                                                                    false;
                                                                isResend =
                                                                    false;
                                                              })
                                                            },
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
                                                        {
                                                          setState(() {
                                                            isLoading = false;
                                                            isResend = true;
                                                          })
                                                        },
                                                    });
                                            if (mounted) {
                                              setState(() {
                                                isLoading = true;
                                              });
                                            }
                                          } catch (e) {
                                            if (mounted) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: white,
                                            border: Border.all(color: navy)),
                                        width: width * .5.w,
                                        height: height * .06.h,
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
                                                      fontSize: 20.sp))),
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
                                          backgroundColor: Colors.red,
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
                                        if (mounted) {
                                          setState(() {
                                            isResend = false;
                                            isLoading = true;
                                          });
                                        }
                                        await signUp();
                                      },
                                      child: new Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: white,
                                            border: Border.all(color: navy)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5.w,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .06.h,
                                        child: Center(
                                            child: Text('Resend Code',
                                                style: GoogleFonts.poppins(
                                                    // fontWeight:
                                                    //     FontWeight.bold,
                                                    color: black,
                                                    fontSize: 20))),
                                      ),
                                    )))
                            : Column(),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Socialmedia()
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    var phonenumber = phone;
    var verifyphone = _auth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        verificationCompleted: (phoneauthcredential) {
          _auth.signInWithCredential(phoneauthcredential).then((user) async => {
                if (user != null)
                  {
                    await _firestore
                        .collection("ILA")
                        .doc(_auth.currentUser!.uid)
                        .set({
                          "name": nameController.text.trim(),
                          "cellnumber": phone.trim(),
                          "location": locationController.text.trim(),
                          "email": emailController.text.trim(),
                        }, SetOptions(merge: true))
                        .then((value) => {
                              if (mounted)
                                {
                                  setState(() {
                                    isLoading = false;
                                    isRegister = false;
                                    isOTPScreen = false;

                                    //navigate to is
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MainHomepage(),
                                      ),
                                      (route) => false,
                                    );
                                  })
                                }
                            })
                        .catchError((onError) => {
                              debugPrint("Error saving user to db." +
                                  onError.toString()),
                              Fluttertoast.showToast(msg: onError.toString())
                            })
                  }
              });
        },
        verificationFailed: (error) {
          setState(() {
            isLoading = false;
          });
        },
        codeSent: (verificationID, [forceResendingToken]) {
          setState(() {
            isLoading = false;
            verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (verificationID) {
          setState(() {
            isLoading = false;
            verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 60));
    await verifyphone;
  }
}
