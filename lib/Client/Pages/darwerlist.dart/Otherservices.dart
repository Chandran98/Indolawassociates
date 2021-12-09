import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/////////////////////////////////////        Legal forms Data Model          /////////////////////////////////

class OtherservicesModel {
  String servicetitle;
  String servicecontent;
  String serviceimage;

  OtherservicesModel(
      {required this.servicetitle,
      required this.servicecontent,
      required this.serviceimage});
}

///////////////////////////////////////////    Legal forms   //////////////////////////////////////////

class OtherServicesform extends StatefulWidget {
  const OtherServicesform({Key? key}) : super(key: key);

  @override
  _OtherServicesformState createState() => _OtherServicesformState();
}

class _OtherServicesformState extends State<OtherServicesform> {
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: navy,
            title: Text(
              translate!.drawerkey3,
              style: GoogleFonts.mulish(
                  color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
            ),
            leading: IconButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Mainhome())),
                icon: Icon(
                  Icons.arrow_back,
                  color: white,
                )),
          ),
          body: otherserviceslist(context)),
    );
  }

  Widget otherserviceslist(context) {
    final translate = AppLocalizations.of(context);

    List<OtherservicesModel> otherservicemodel = [
      OtherservicesModel(
        servicetitle: translate!.otherservicetitle1,
        servicecontent:
           translate.otherservicessub1,serviceimage: 'assets/images/bulk.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle2,
        servicecontent:
        translate.otherservicessub2,    serviceimage: 'assets/images/businessincome.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle3,
        servicecontent:
        translate.otherservicessub3,serviceimage: 'assets/images/capitalofimage.jpeg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle4,
        servicecontent:
        translate.otherservicessub4,    serviceimage: 'assets/images/COD.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle5,
        servicecontent:
         translate.otherservicessub5,   serviceimage: 'assets/images/regoffice.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle6,
        servicecontent:
           translate.otherservicessub6,      serviceimage: 'assets/images/Annual.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle7,
        servicecontent:
            translate.otherservicessub7,       serviceimage: 'assets/images/drugli.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle8,
        servicecontent:
         translate.otherservicessub8, serviceimage: 'assets/images/ESIC.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle9,
        servicecontent:
      translate.otherservicessub9,   serviceimage: 'assets/images/msme.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle10,
        servicecontent:
         translate.otherservicessub10,  serviceimage: 'assets/images/fssai.jpg',
      ),
      OtherservicesModel(
        servicetitle:  translate.otherservicetitle11,
        servicecontent:
           translate.otherservicessub11,   serviceimage: 'assets/images/gstreturn.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle12,
        servicecontent:
           translate.otherservicessub12,   serviceimage: 'assets/images/incometaxreturn.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle13,
        servicecontent:
          translate.otherservicessub13,      serviceimage: 'assets/images/isoreg.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle14,
        servicecontent:
          translate.otherservicessub14,  serviceimage: 'assets/images/patentreg.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle15,
        servicecontent:
      translate.otherservicessub15,   serviceimage: 'assets/images/taxreg.png',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle16,
        servicecontent:
       translate.otherservicessub16,  serviceimage: 'assets/images/nclt.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle17,
        servicecontent:
       translate.otherservicessub17,  serviceimage: 'assets/images/rera2.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle18,
        servicecontent:
     translate.otherservicessub18,   serviceimage: 'assets/images/roc.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle19,
        servicecontent:
       translate.otherservicessub19,  serviceimage: 'assets/images/tradeli.jpg',
      ),
      OtherservicesModel(
        servicetitle:   translate.otherservicetitle20,
        servicecontent:
           translate.otherservicessub20,   serviceimage: 'assets/images/tradeassignment.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle21,
        servicecontent:
          translate.otherservicessub21,  serviceimage: 'assets/images/tradeobj.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle22,
        servicecontent:
      translate.otherservicessub22,  serviceimage: 'assets/images/tradereg.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle23,
        servicecontent:
            translate.otherservicessub23,     serviceimage: 'assets/images/trademarkrenewal.jpg',
      ),
    ];
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: otherservicemodel.length,
      itemBuilder: (context, index) {
        return ListTile(
            leading: Icon(Icons.logout, color: navy),
            title: Text(
              otherservicemodel[index].servicetitle,
              style: hStyle,
            ),
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Otherservicescardfd(
                          servicetitle: otherservicemodel[index].servicetitle,
                          servicecontent:
                              otherservicemodel[index].servicecontent,
                          serviceimage: otherservicemodel[index].serviceimage,
                        ))));
      },
    );
  }
}

////////////////////////////////    Legal forms Page      ////////////////////////////////

class Otherservicescardfd extends StatefulWidget {
  const Otherservicescardfd(
      {Key? key,
      required this.servicetitle,
      required this.servicecontent,
      required this.serviceimage})
      : super(key: key);

  final String servicetitle, servicecontent, serviceimage;

  @override
  _OtherservicescardfdState createState() => _OtherservicescardfdState();
}

class _OtherservicescardfdState extends State<Otherservicescardfd> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // ignore: unused_field
  late FormModel _formModel;

  final _namecontroller = TextEditingController();
  // final _gendercontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _mobilecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _servicecontroller = TextEditingController();

  var gendertry;
  List genderlist = ["Male", "Female", "Others"];
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
  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OtherServicesform()));
  }

  launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.065.h,
          backgroundColor: white,
          title: Text(widget.servicetitle,
              style: GoogleFonts.mulish(
                  fontSize: 18.5.sp, fontWeight: FontWeight.w500, color: navy)),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OtherServicesform())),
              icon: Icon(
                Icons.arrow_back,
                color: navy,
              )),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: gold,
          onPressed: () => showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              enableDrag: false,
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: buildformsheet(),
                    ),
                  )),
          label: Text(translate!.apply),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.serviceimage),
                      fit: BoxFit.cover)),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical:500.0),
            //   child:
            // )
            Padding(
              padding: const EdgeInsets.only(top: 170.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1.h,
                height: MediaQuery.of(context).size.height * 0.58.h,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                    child: Column(
                      children: [
                        Text(
                          widget.servicetitle,
                          style: bStyle,
                          textScaleFactor: 1,
                        ),
                        // Text("Experience ${toplawyerlist.Experience}",style: hStyle,),
                        // Text(
                        //   "toplawyerlist.type",
                        //     style: GoogleFonts.mulish(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 16,
                        //         color: navy)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03.h,
                        ),
                        Text(
                          widget.servicecontent,
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                              color: navy),
                          textAlign: TextAlign.justify,
                          textScaleFactor: 1.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02.h,
                            ),
                            Text(
                              translate.drawerkey5,
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.sp,
                                  color: gold),
                              textAlign: TextAlign.justify,
                              textScaleFactor: 1,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.015.h,
                            ),
                            InkWell(
                              onTap: () {
                                launcher("mailto: indolawassociates@gmail.com");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: navy,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "info@indolawassociates.com",
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp,
                                        color: navy),
                                    textAlign: TextAlign.justify,
                                    textScaleFactor: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01.h,
                            ),
                            InkWell(
                              onTap: () {
                                launcher("tel: 8940383000");
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call_sharp,
                                    color: navy,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "8940383000",
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp,
                                        color: navy),
                                    textAlign: TextAlign.justify,
                                    textScaleFactor: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  color: navy,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FittedBox(
                                  child: Text(
                                    "${translate.workingshift}: 8am-6pm",
                                    style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.sp,
                                        color: navy),
                                    textAlign: TextAlign.justify,
                                    textScaleFactor: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget buildformsheet() => SafeArea(
    child: SingleChildScrollView(
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
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Fill The Form",
                          style: GoogleFonts.mulish(
                              color: navy,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02.h),
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
  
                      //   TextFormField(
                      //     controller: _gendercontroller,
                      //     decoration: InputDecoration(
                      //         border: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(20))),
                      //         labelText: "Gender",
                      //         labelStyle: TextStyle(
                      //             color: navy, fontWeight: FontWeight.bold))),
                      // SizedBox(height: 20),
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
  
                      TextFormField(
                          controller: _servicecontroller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              labelText: "Services",
                              labelStyle: TextStyle(
                                  color: navy, fontWeight: FontWeight.bold))),
                      SizedBox(height: 20),
                      // ignore: deprecated_member_use
                      // Container(color: gold,height: MediaQuery.of(context).size.height *0.05,width: MediaQuery.of(context).size.height *0.2,
                      //   child: InkWell(
  
                      //     // onPressed: () async{if(_formkey.currentState!.validate()){
                      //     //   String name = _namecontroller.text;
                      //     //   String email = _emailcontroller.text;
                      //     //   String address = _addresscontroller.text;
                      //     //   String gender = _gendercontroller.text;
                      //     //   String mobile = _mobilecontroller.text;
                      //     //   String service = _servicecontroller.text;
  
                      //       // FormModel? forms = await submitdata(
                      //       //     name, gender, email, address, mobile, service);
                      //       // setState(() {
                      //       //   _formModel = forms!;
                      //       // });
  
                      //     // }},
  
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
                            height: MediaQuery.of(context).size.height * .05.h,
                            width: MediaQuery.of(context).size.width * .3.w,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.green,
                              elevation: 7.0,
                              child: TextButton(
                                onPressed: ()
  //                               {
  
                                    async {
                                  if (_formkey.currentState!.validate()) {
                                    servicesform();
                                    // String name = _namecontroller.text;
                                    // String email = _emailcontroller.text;
                                    // String address = _addresscontroller.text;
                                    // String gender = gendertry;
                                    // String mobile = _mobilecontroller.text;
                                    // String service = _servicecontroller.text;
  
                                    // FormModel forms = await submitdata(name,
                                    //     gender, email, address, mobile, service);
                                    // setState(() {
                                    //   _formModel = forms;
                                      Navigator.of(context).pop();
  
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Submitted"),
                                          )
                                    );
                                  }
                                },
                                child: Center(
                                    child: Text('Submit',
                                        style: TextStyle(
                                            color: white, fontSize: 20))),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .05.h,
                            width: MediaQuery.of(context).size.width * .3.w,
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
        ),
  );
Future<void> servicesform() async {
    // FirebaseAuth _auth = FirebaseAuth.instance;

    CollectionReference lawyerform =
        FirebaseFirestore.instance.collection("ILA Services forms");
    return lawyerform.add({
      "Name": _namecontroller.text.trim(),
      "Mobile": _mobilecontroller.text.trim(),
      "Email": _emailcontroller.text.trim(),
      "Services": _servicecontroller.text.trim(),
      "Address": _addresscontroller.text.trim(),
      "Gender": gendertry
    }).then((value) => SnackBar(content: Text("Updated")));
  }


}

// Future<FormModel> submitdata(
//     String name, gender, email, address, mobile, service) async {
//   var response = await http
//       .post(Uri.parse("http://api.indolawassociates.com/api/form"), body: {
//     "name": name,
//     "gender": gender,
//     "email": email,
//     "address": address,
//     "mobile": mobile,
//     "service": service,
//   });
//   final data = response.body;
//   return formModelFromJson(data);
//   // if (response.statusCode == 201) {

//   // } else {
//   //   return null;
//   // }
// }
