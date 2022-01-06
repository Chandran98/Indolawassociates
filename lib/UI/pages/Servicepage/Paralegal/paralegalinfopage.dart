import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import 'package:indolawassociates/UI/components/button.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ParalegalPage extends StatefulWidget {
  const ParalegalPage(
      {Key? key, required this.Paralegaltitle, required this.paralegalcontent})
      : super(key: key);

  final String Paralegaltitle, paralegalcontent;

  @override
  _ParalegalPageState createState() => _ParalegalPageState();
}

class _ParalegalPageState extends State<ParalegalPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: unused_field
  late FormModel _formModel;

  final _namecontroller = TextEditingController();
  final _gendercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _servicecontroller = TextEditingController();

  void onback() {
    Navigator.pushNamed(context, servicespage);
  }

  var gendertry;
  List genderlist = ["Male", "Female", "Others"];
  var whatsapp = "+91 8940383000";

  var paralegal;
  List paralegallist = [
    "Adhar card",
    "Pan card",
    "Birth and Death Certificate",
    "Will and Gift writing",
    "Legal Notice",
    "EC,Patta, Land Verification",
    "Education Issues",
    "Affidavits"
  ];
  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  Future<void> servicesform() async {
    // FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference lawyerform =
        FirebaseFirestore.instance.collection("Paralegal forms");
    return lawyerform.add({
      "Name": _namecontroller.text.trim(),
      "Mobile": _mobilecontroller.text.trim(),
      "Email": _emailcontroller.text.trim(),
      "Services": paralegal,
      "Address": _addresscontroller.text.trim(),
      "Gender": gendertry
    }).then((value) => SnackBar(content: Text("Updated")));
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _mobilecontroller.dispose();
    _emailcontroller.dispose();
    _servicecontroller.dispose();
    _servicecontroller.dispose();
    _addresscontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final translate = AppLocalizations.of(context);
    return WillPopScope(
        onWillPop: () {
          onback();
          return Future.value(false);
        },
        child: SafeArea(
            child: Scaffold(
                // appBar: AppBar(
                //   toolbarHeight: MediaQuery.of(context).size.height * 0.065.h,
                //   backgroundColor: white,
                //   title: Text(widget.Paralegaltitle,
                //       style: GoogleFonts.mulish(
                //           fontSize: 18.5.sp,
                //           fontWeight: FontWeight.w500,
                //           color: navy)),
                //   leading: IconButton(
                //       onPressed: () => Navigator.pushReplacement(context,
                //           MaterialPageRoute(builder: (context) => TParalegal())),
                //       icon: Icon(
                //         Icons.arrow_back,
                //         color: navy,
                //       )),
                // ),
                // floatingActionButton: FloatingActionButton.extended(
                //   backgroundColor: gold,
                //   onPressed: () => showModalBottomSheet(
                //       shape: RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.vertical(top: Radius.circular(25))),
                //       enableDrag: false,
                //       isScrollControlled: true,
                //       context: context,
                //       builder: (context) => SingleChildScrollView(
                //             child: Container(
                //               padding: EdgeInsets.only(
                //                   bottom: MediaQuery.of(context).viewInsets.bottom),
                //               child: buildformsheet(),
                //             ),
                //           )),
                //   label: Text(
                //     translate!.apply,
                //   ),
                //   icon: Icon(Icons.arrow_back_ios_new_rounded),
                // ),
                body: Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Row(
                    children: <Widget>[
                      Container(
                        child: IconButton(
                            iconSize: 40,
                            color: white,
                            icon: Image.asset(
                              "assets/icons/rback.png",
                              color: iconcolor,
                              height: 20.h,
                            ),
                            onPressed: () =>
                                Navigator.pushNamed(context, servicespage)),
                      ),
                      SizedBox(
                        width: width * 0.02.w,
                      ),
                      Expanded(
                        child: AutoSizeText(widget.Paralegaltitle,
                            style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: black)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.03.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/intro_screen3.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.paralegalcontent,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: black),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.002.h,
                  ),

                  TextButton(
                    onPressed: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25))),
                        enableDrag: false,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: buildformsheet(),
                              ),
                            )),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: white,
                            border: Border.all(color: navy)),
                        height: height * 0.06,
                        width: width * 0.4,
                        // padding: const EdgeInsets.symmetric(
                        //   vertical: 15.0,
                        //   horizontal: 15.0,
                        // ),
                        child: Center(
                          child: Text(
                            translate!.apply,
                            style: GoogleFonts.poppins(
                                // fontWeight: FontWeight.bold,
                                color: black,
                                fontSize: 11.sp),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),

                  // CustomButton(
                  //   style: GoogleFonts.poppins(
                  //       // fontWeight: FontWeight.bold,
                  //       color: black,
                  //       fontSize: 11.sp),
                  //   height: height * 0.06,
                  //   text: translate!.apply,
                  //   width: width * 0.4,
                  //   onpressed: () => showModalBottomSheet(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //               top: Radius.circular(25))),
                  //       enableDrag: false,
                  //       isScrollControlled: true,
                  //       context: context,
                  //       builder: (context) => SingleChildScrollView(
                  //             child: Container(
                  //               padding: EdgeInsets.only(
                  //                   bottom: MediaQuery.of(context)
                  //                       .viewInsets
                  //                       .bottom),
                  //               child: buildformsheet(),
                  //             ),
                  //           )),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: divcolor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.003.h,
                  ),
                  Text(
                    translate.drawerkey5,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        // fontWeight: FontWeight.bold,
                        color: black,
                        fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: height * 0.0031.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          launcher("tel: 8940383000");
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: white,
                                border: Border.all(color: navy)),
                            height: height * 0.06,
                            width: width * 0.35,
                            // padding: const EdgeInsets.symmetric(
                            //   vertical: 15.0,
                            //   horizontal: 15.0,
                            // ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/icons/call.png",
                                    color: black,
                                    height: 3.5.h,
                                  ),
                                  Text(
                                    translate.mobile,
                                    style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        color: black,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )),
                      ),

                      TextButton(
                        onPressed: () async => await launch(
                            "https://wa.me/$whatsapp?text= Hi, I have an emergency"),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35),
                                color: white,
                                border: Border.all(color: navy)),
                            height: height * 0.06,
                            width: width * 0.35,
                            // padding: const EdgeInsets.symmetric(
                            //   vertical: 15.0,
                            //   horizontal: 15.0,
                            // ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(
                                    (FontAwesomeIcons.whatsapp),
                                    color: Colors.green,
                                  ),
                                  AutoSizeText(
                                    translate.whatsapp,
                                    style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        color: black,
                                        fontSize: 12.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )),
                      ),

                      //   , CustomButton(
                      // height: height * 0.06,
                      //     text: "Email us",
                      //     width: width*0.35,
                      //     onpressed: (){},
                      //     style: GoogleFonts.poppins(
                      //   // fontWeight: FontWeight.bold,
                      //   color: black,
                      //   fontSize: 12.sp),)
                    ],
                  )
                ],
              ),
            ),
          ),
        )

                // SingleChildScrollView(
                //     child: Stack(
                //   children: [
                //     Container(
                //       height: MediaQuery.of(context).size.height * 0.25.h,
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage("assets/images/intro_screen3.jpg"),
                //               fit: BoxFit.cover)),
                //     ),
                //     // Padding(
                //     //   padding: const EdgeInsets.symmetric(vertical:500.0),
                //     //   child:
                //     // )
                //     Padding(
                //       padding: const EdgeInsets.only(top: 170.0),
                //       child: Container(
                //         height: MediaQuery.of(context).size.height * 0.58.h,
                //         decoration: BoxDecoration(
                //             color: white,
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(22),
                //               topRight: Radius.circular(22),
                //             )),
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Padding(
                //             padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   widget.Paralegaltitle,
                //                   style: bStyle,
                //                   textScaleFactor: 1,
                //                 ),

                //                 // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                //                 // Text(
                //                 //   "toplawyerlist.type",
                //                 //     style: GoogleFonts.mulish(
                //                 //         fontWeight: FontWeight.w600,
                //                 //         fontSize: 16,
                //                 //         color: navy)),
                //                 SizedBox(
                //                   height: MediaQuery.of(context).size.height * 0.03.h,
                //                 ),
                //                 Text(
                //                   widget.paralegalcontent,
                //                   style: GoogleFonts.mulish(
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 13.sp,
                //                       color: navy),
                //                   textAlign: TextAlign.justify,
                //                   textScaleFactor: 1,
                //                 ),
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height * 0.02.h,
                //                     ),
                //                     Text(
                //                       translate.drawerkey5,
                //                       style: GoogleFonts.mulish(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 17.sp,
                //                           color: gold),
                //                       textAlign: TextAlign.justify,
                //                       textScaleFactor: 1,
                //                     ),
                //                     SizedBox(
                //                       height: MediaQuery.of(context).size.height *
                //                           0.015.h,
                //                     ),
                //                     InkWell(
                //                       onTap: () {
                //                         launcher(
                //                             "mailto: indolawassociates@gmail.com");
                //                       },
                //                       child: Row(
                //                         children: [
                //                           Icon(
                //                             Icons.mail,
                //                             color: navy,
                //                           ),
                //                           SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(
                //                             "info@indolawassociates.com",
                //                             style: GoogleFonts.mulish(
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 15.sp,
                //                                 color: navy),
                //                             textAlign: TextAlign.justify,
                //                             textScaleFactor: 1,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height * 0.01.h,
                //                     ),
                //                     InkWell(
                //                       onTap: () {
                //                         launcher("tel: 8940383000");
                //                       },
                //                       child: Row(
                //                         children: [
                //                           Icon(
                //                             Icons.call_sharp,
                //                             color: navy,
                //                           ),
                //                           SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(
                //                             "8940383000",
                //                             style: GoogleFonts.mulish(
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 15.sp,
                //                                 color: navy),
                //                             textAlign: TextAlign.justify,
                //                             textScaleFactor: 1,
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                     SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height * 0.01.h,
                //                     ),
                //                     Row(
                //                       children: [
                //                         Icon(
                //                           Icons.timer_rounded,
                //                           color: navy,
                //                         ),
                //                         SizedBox(
                //                           width: 10,
                //                         ),
                //                         FittedBox(
                //                           child: Text(
                //                             "${translate.workingshift}: 8am-6pm",
                //                             style: GoogleFonts.mulish(
                //                                 fontWeight: FontWeight.w600,
                //                                 fontSize: 15.sp,
                //                                 color: navy),
                //                             textAlign: TextAlign.justify,
                //                             textScaleFactor: 1,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // )),

                )));
  }

  Widget buildformsheet() => SingleChildScrollView(
        //       child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Fill The Form",
                        style: GoogleFonts.mulish(
                            color: navy,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003.h),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: usernamenull),
                        ]),
                        controller: _namecontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(
                              Icons.person,
                              color: navy,
                            ),
                            labelText: "Name",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _emailcontroller,
                        validator: MultiValidator([
                          RequiredValidator(errorText: emailnull),
                          PatternValidator(
                              (r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"),
                              errorText: invalidemail)
                        ]),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: navy,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: DropdownButton(
                        underline: SizedBox(),
                        iconSize: 35,
                        iconEnabledColor: navy,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        hint: Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: navy,
                              fontWeight: FontWeight.bold),
                        ),
                        items: genderlist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            gendertry = selected;
                          });
                        },
                        value: gendertry,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _mobilecontroller,
                        keyboardType: TextInputType.numberWithOptions(),
                        validator: MultiValidator([
                          MaxLengthValidator(10, errorText: phonenummax),
                          MinLengthValidator(10, errorText: phonenummin)
                        ]),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            prefixIcon: Icon(
                              Icons.mobile_screen_share,
                              color: navy,
                            ),
                            labelText: "Mobile",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: addressnull),
                        ]),
                        keyboardType: TextInputType.streetAddress,
                        controller: _addresscontroller,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            labelText: "Address",
                            labelStyle: TextStyle(
                                color: navy, fontWeight: FontWeight.bold))),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(5),
                      child: DropdownButton(
                        underline: SizedBox(),
                        iconSize: 35,
                        iconEnabledColor: navy,
                        isExpanded: true,
                        dropdownColor: Colors.white,
                        hint: Text(
                          "Services",
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: navy,
                              fontWeight: FontWeight.bold),
                        ),
                        items: paralegallist.map((valueitem) {
                          return DropdownMenuItem(
                            value: valueitem,
                            child: Text(valueitem),
                          );
                        }).toList(),
                        onChanged: (selected) {
                          setState(() {
                            paralegal = selected;
                          });
                        },
                        value: paralegal,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Container(color: gold,height: MediaQuery.of(context).size.height *0.05,width: MediaQuery.of(context).size.height *0.2,
                    //   child: InkWell(

                    //     onDoubleTap: () async{if(_formkey.currentState!.validate()){
                    //       String name = _namecontroller.text;
                    //       String email = _emailcontroller.text;
                    //       String address = _addresscontroller.text;
                    //       String gender = _gendercontroller.text;
                    //       String mobile = _mobilecontroller.text;
                    //       String service = _servicecontroller.text;

                    //       FormModel? forms = await submitdata(
                    //           name, gender, email, address, mobile, service);
                    //       setState(() {
                    //         _formModel = forms!;
                    //       });

                    //     }},

                    //     child: Text(
                    //       "Submit",
                    //       style: GoogleFonts.mulish(color: Colors.white),
                    //     ),
                    //      onTap: () {  },
                    //   ),

                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .008.h,
                          width: MediaQuery.of(context).size.width * .08.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  servicesform();
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text("Submitted"),
                                  ));
                                }
                              },
                              //  {
                              //   Navigator.of(context).pop();

                              //   ScaffoldMessenger.of(context)
                              //       .showSnackBar(SnackBar(
                              //     content: Text("Submitted"),
                              //   ));
                              // },
                              //     async {
                              //   if (_formkey.currentState!.validate()) {
                              //     String name = _namecontroller.text;
                              //     String email = _emailcontroller.text;
                              //     String address = _addresscontroller.text;
                              //     String gender = gendertry;
                              //     String mobile = _mobilecontroller.text;
                              //     String service = paralegal;

                              //     FormModel forms = await submitdata(name,
                              //         gender, email, address, mobile, service);
                              //     setState(() {
                              //       _formModel = forms;
                              //       Navigator.pop(context);
                              //     });
                              //   }
                              // },
                              child: Center(
                                  child: Text('Submit',
                                      style: TextStyle(
                                          color: white, fontSize: 20))),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .008.h,
                          width: MediaQuery.of(context).size.width * .08.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: Text('Back',
                                      style: TextStyle(
                                          color: white, fontSize: 20))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          //   ),
        ),
      );
}
