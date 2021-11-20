import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
/////////////////////////////////////        Legal forms Data Model          /////////////////////////////////

class Paramodel {
  String Paralegaltitle,paralegalcontent;
  Paramodel({required this.Paralegaltitle,required this.paralegalcontent});
}

///////////////////////////////////////////    Legal forms   //////////////////////////////////////////

class Paralegal extends StatefulWidget {
  const Paralegal({Key? key}) : super(key: key);

  @override
  _ParalegalState createState() => _ParalegalState();
}

class _ParalegalState extends State<Paralegal> {
  final List<Paramodel> paralegallist = [
    Paramodel(Paralegaltitle: "Adhar card", paralegalcontent: "Aadhaar number is verifiable in an online, cost-effective way. It is unique and robust enough to eliminate duplicates and fake identities and may be used as a basis/primary identifier to roll out several Government welfare schemes and programmes for effective service delivery thereby promoting transparency and good governance. "),
    Paramodel(Paralegaltitle: "Pan card", paralegalcontent: "PAN system of identification is a computer-based system that assigns unique identification number to every Indian tax paying entity. Through this method, all tax-related information for a person is recorded against a single PAN number which acts as the primary key for storage of information."),
    Paramodel(Paralegaltitle: "Birth and Death Certificate", paralegalcontent: "Birth certificates are often needed for obtaining licenses, getting government benefits and registering for school. While many people turn to the Internet to order additional or replacement birth certificates."),
    Paramodel(Paralegaltitle: "Will and Gift writing", paralegalcontent: " A Will, as defined under the Indian Succession Act, 1925, is the legal declaration of the intention of a testator with respect to his property which he desires to be carried into effect after his death."),
    // Paramodel(Paralegaltitle: " Legal Notice", paralegalcontent: ''),
    Paramodel(Paralegaltitle: "EC,Patta, Land Verification", paralegalcontent: " Patta is a legal document to prove the lawful ownership of a person on land, it becomes a crucial document in case of any dispute between the landholder and the government or any third-party landowner. One becomes eligible to get compensation in case the government decides to acquire the land."),
    Paramodel(Paralegaltitle: " Education Issues", paralegalcontent: 'Education is the most imperative segment out of different segments of a social foundation. The accomplished and appropriately prepared manpower can quicken the pace of monetary development. Despite our earnest attempts, our instructive improvement still stays at a low dimension.'),
    Paramodel(Paralegaltitle: "Affidavits", paralegalcontent: "An Affidavit is simply a written, notarized sworn statement. An Affidavit can be used for nearly any reason such as to attest to someone's death or birth, to state a place of residence, or to be entered as evidence in a court trial. When you sign an affidavit, you are simply attesting, under law, that you swear a statement written in the affidavit is true."),
  ];

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Mainhome()));
  }

  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: navy,
          title: Text(
            "Para Legal Services",
            style: GoogleFonts.mulish(
                color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Mainhome())),
              icon: Icon(
                Icons.arrow_back,
                color: white,
              )),
        ),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: paralegallist.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.logout, color: navy),
                title: Text(
                  paralegallist[index].Paralegaltitle,
                  style: hStyle,
                ),
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ParalegalPage(paralegalcontent: paralegallist[index].paralegalcontent,
                            Paralegaltitle:
                                paralegallist[index].Paralegaltitle))));
          },
        ),
      ),
    );
  }
}

////////////////////////////////    Legal forms Page      ////////////////////////////////

class ParalegalPage extends StatefulWidget {
  const ParalegalPage({Key? key, required this.Paralegaltitle,required this.paralegalcontent})
      : super(key: key);

  final String Paralegaltitle,paralegalcontent;

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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Paralegal()));
  }

  var gendertry;
  List genderlist = ["Male", "Female","Others"];

  var paralegal;
  List paralegallist = [
    "Adhar card",
    "Pan card",
    "Birth and Death Certificate",
    "Will and Gift writing",
    " Legal Notice",
    "EC,Patta, Land Verification",
    " Education Issues",
    "Affidavits"
  ];
launcher(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("");
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.065.h,
          backgroundColor: white,
          title: Text(widget.Paralegaltitle,
              style: GoogleFonts.mulish(
                  fontSize: 18.5.sp, fontWeight: FontWeight.w500, color: navy)),
          leading: IconButton(
              onPressed: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Paralegal())),
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
          label: Text(
            "Apply for issues",
          ),
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/intro_screen3.jpg"),
                      fit: BoxFit.cover)),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical:500.0),
            //   child:
            // )
            Padding(
              padding: const EdgeInsets.only(top: 170.0),
              child: Container(
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
                          widget.Paralegaltitle,
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
                         widget.paralegalcontent,
                          style: GoogleFonts.mulish(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                              color: navy),
                          textAlign: TextAlign.justify,
                          textScaleFactor: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02.h,
                            ),
                            Text(
                              "Contact info",
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
                            InkWell(  onTap: () {
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
                            InkWell(  onTap: () {
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
                                Text(
                                  "Monday To Saturday: 8am-6pm",
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color: navy),
                                  textAlign: TextAlign.justify,
                                  textScaleFactor: 1,
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
                          height: MediaQuery.of(context).size.height * .05.h,
                          width: MediaQuery.of(context).size.width * .3.w,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.green,
                            elevation: 7.0,
                            child: TextButton(
                              onPressed: ()
                                  //  {
                                  //   Navigator.of(context).pop();

                                  //   ScaffoldMessenger.of(context)
                                  //       .showSnackBar(SnackBar(
                                  //     content: Text("Submitted"),
                                  //   ));
                                  // },
                                  async {
                                if (_formkey.currentState!.validate()) {
                                  String name = _namecontroller.text;
                                  String email = _emailcontroller.text;
                                  String address = _addresscontroller.text;
                                  String gender = gendertry;
                                  String mobile = _mobilecontroller.text;
                                  String service = paralegal;

                                  FormModel forms = await submitdata(name,
                                      gender, email, address, mobile, service);
                                  setState(() {
                                    _formModel = forms;
                                    Navigator.pop(context);
                                  });
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
      );
}

Future<FormModel> submitdata(
    String name, gender, email, address, mobile, service) async {
  final response = await http
      .post(Uri.parse("http://api.indolawassociates.com/api/form"), body: {
    "name": name,
    "gender": gender,
    "email": email,
    "address": address,
    "mobile": mobile,
    "service": service,
  });
  var data = response.body;
  return formModelFromJson(data);

  // if (response.statusCode == 201) {
  //   final  data = response.body;
  //   return formModelFromJson(data);
  // } else {
  //   return null;
  // }
}
