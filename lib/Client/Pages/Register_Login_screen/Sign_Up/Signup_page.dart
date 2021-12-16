import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Register_Login_screen/Login/Login_page.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController cellnumberController =
      new TextEditingController();
  final TextEditingController otpController = new TextEditingController();
  final TextEditingController locationController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();

  var isLoading = false;
  var isResend = false;
  var isRegister = true;
  var isOTPScreen = false;
  var verificationCode = '';
  late String phone;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    cellnumberController.dispose();
    otpController.dispose();
    locationController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isOTPScreen ? otpscreenpage() : signupscreen();
  }

  signupscreen() {
    final node = FocusScope.of(context);

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
              padding: const EdgeInsets.only(left: 25.0, right: 25, top: 30),
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
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
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
                                  labelStyle: hStyle),
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
                              // controller: cellnumberController,
                              onChanged: (phoneNumber) {
                                setState(() {
                                  phone = phoneNumber.completeNumber;
                                  print(phone);
                                });
                              },
                            ),

                            //  TextFormField(
                            //   enabled: !isLoading,
                            //   keyboardType: TextInputType.phone,
                            //   controller: cellnumberController,
                            //   textInputAction: TextInputAction.done,
                            //   onFieldSubmitted: (_) => node.unfocus(),
                            //   decoration: InputDecoration(
                            //       floatingLabelBehavior:
                            //           FloatingLabelBehavior.never,
                            //       prefixIcon: Icon(
                            //         Icons.phone,
                            //         color: navy,
                            //       ),
                            //       labelText: "Mobile no.",
                            //       hintText: "Mobile ",
                            //       labelStyle: hStyle),
                            //   validator: MultiValidator([
                            //     MaxLengthValidator(10, errorText: phonenummax),
                            //     MinLengthValidator(10, errorText: phonenummin)
                            //   ]),
                            // ),
                          )),
                          Container(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
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
                                vertical: 10.0, horizontal: 10.0),
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
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: gold),
                            height: MediaQuery.of(context).size.height * .06.h,
                            width: MediaQuery.of(context).size.width * .6.w,
                            margin: EdgeInsets.only(top: 40, bottom: 5),
                            child: Material(
                                elevation: 4,
                                color: gold,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: new TextButton(
                                      onPressed: () {
                                        if (!isLoading) {
                                          if (_formKey.currentState!
                                              .validate()) {
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
                                    ))),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02.h,
                          ),
                          Container(
                              height:
                                  MediaQuery.of(context).size.height * .06.h,
                              width: MediaQuery.of(context).size.width * .6.w,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                color: white,
                                elevation: 4.0,
                                child: TextButton(
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Loginpage())),
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01.h,
                          ),
                          Text(
                            'By continuing your confirm that you agree \nwith our Term and Condition',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.mulish(
                                color: navy, fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02.h,
                          ),
                        ],
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

  otpscreenpage() {
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
                        Center(
                          child: Container(
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 60.0, horizontal: 50.0),
                                  child: Center(
                                    child: Text(
                                      !isLoading
                                          ? "Verify Your OTP "
                                          : "Verifying OTP code via SMS",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.mulish(
                                          fontSize: 20,
                                          color: navy,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                        ),
                        !isLoading
                            ? Container(
                                child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1.0, horizontal: 10.0),
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
                                                        smsCode: otpController
                                                            .text
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
                                                                  Mainhome(),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6.w,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .07.h,
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
                                            Mainhome(),
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
