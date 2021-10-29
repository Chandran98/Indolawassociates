import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/Client/model/form_model.dart';
import '../../../main.dart';
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
  List<OtherservicesModel> otherservicemodel = [
    OtherservicesModel(
      servicetitle: "Bulk Return Filing",
      servicecontent:
          "Bulk return filing for corporates, CA and accountant Legal Clinics is the most trusted Income Tax Return e-filing service Are you looking for the easiest way to e-File Bulk Income Tax Return? Look no further as Legal Clinics provides you with fully assisted e-filing by tax experts. Get your return prepared by our experts.",
      serviceimage: 'assets/images/bulk.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Business Income Return",
      servicecontent:
          "Income tax is tax levied on the income of a person by the Government of India as per the provisions contained in the Income Tax Act 1961. It is levied on income earned during the year starting from 1 April and ending 31st March.",
      serviceimage: 'assets/images/businessincome.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Change in Authorized Capital Of company",
      servicecontent:
          "The authorized capital is the maximum amount of capital which a Company can raise through the issue of shares to its shareholders. Authorized share capital is mentioned in the Memorandum of Association of the company. The company can raise capital up to this amount. . An increase in authorized capital is required for issuing new shares and inducting more capital into the company.",
      serviceimage: 'assets/images/capitalofimage.jpeg',
    ),
    OtherservicesModel(
      servicetitle: "Change in Directors",
      servicecontent:
          "Directors are appointed by the shareholders of a Company for the management of a Company. A Private Limited Company is required to have a minimum of two Directors and a Limited Company is required to have a minimum of three Directors.  Appointment or removal of a Director or Designated Partners is thus required due to various reasons.",
      serviceimage: 'assets/images/COD.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Change In registered Office",
      servicecontent:
          "Section 12 of Companies Act, 2013 mandates all the companies to have registered office either at the time of incorporation or within 30 days of incorporation. Registered office of a company is a place where all the communications and notices may be sent. The situation clause of Memorandum of Association contains the state in which registered office of the company is situated.",
      serviceimage: 'assets/images/regoffice.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Company Annual Filing",
      servicecontent:
          "Income tax is tax levied on the income of a person by the Government of India as per the provisions contained in the Income Tax Act 1961. It is levied on income earned during the year starting from 1 April and ending 31st March.",
      serviceimage: 'assets/images/Annual.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Drug License",
      servicecontent:
          "Drug License is mandatory to do business in Drugs & Cosmetics in India. The provisions for this has been made in Drugs & Cosmetics Act, 1940 which is applicable to whole of India. It is an Act to consolidate all the laws relating to drugs & cosmetics, which established the Drugs Control Department. In 1964, the Act was amended to include Ayurvedic & Unani drugs.",
      serviceimage: 'assets/images/drugli.jpg',
    ),
    OtherservicesModel(
      servicetitle: "ESIC Registration",
      servicecontent:
          "Employee State Insurance Corporation or ESIC is a self-financing social security and health insurance scheme which provides medical benefit, sickness benefit, maternity benefit, disablement benefit and various other benefits such as funeral expenses, free supply of physical aids etc. to the employees and their family.",
      serviceimage: 'assets/images/ESIC.jpg',
    ),
    OtherservicesModel(
      servicetitle: "ESME/MSME/SSI Registration",
      servicecontent:
          "The Micro, Small and Medium Enterprises are considered as a very significant piece of India’s legacy economic model and a part of the critical supply chain for products and services. There were around 633.8 lakh unincorporated non-agriculture enterprises in the country which are dealing in different economic activities providing employment to 11.10 crore workers.",
      serviceimage: 'assets/images/msme.jpg',
    ),
    OtherservicesModel(
      servicetitle: "FSSAI Food License",
      servicecontent:
          "FSSAI registration is a mandatory compliance used to ensure the safety of food products and it is essentially a food safety certificate issued by the food authority in India. FSSAI license is mandatory before starting any food business. All the manufacturers, traders, restaurants who are involved in food business must obtain a 14-digit registration or a license number which must be printed on food packages.",
      serviceimage: 'assets/images/fssai.jpg',
    ),
    OtherservicesModel(
      servicetitle: "GST Return",
      servicecontent:
          "Every person registered under the GST Act has to periodically furnish the details of sales and purchases along with tax collected and paid thereon, respectively, by filing online returns. Before filing the return, payment of tax due is compulsory otherwise such return will be invalid. GST Return filling is done by Legal Clinics.",
      serviceimage: 'assets/images/gstreturn.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Income Tax Return",
      servicecontent:
          "Income tax is tax levied on the income of a person by the Government of India as per the provisions contained in the Income Tax Act 1961. It is levied on income earned during the year starting from 1 April and ending 31st March. Legal Clinics provide Income Tax Return Filing.",
      serviceimage: 'assets/images/incometaxreturn.jpg',
    ),
    OtherservicesModel(
      servicetitle: "ISO Registration",
      servicecontent:
          "International Standards Organization (ISO) is an independent organization that sets the standards for businesses in terms of quality, safety, and efficiency of products. An ISO registration enhances the reputation of your service or product. There are different types of ISO certification like ISO 9001, ISO 14001, ISO 5001, etc.",
      serviceimage: 'assets/images/isoreg.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Patent Registration",
      servicecontent:
          "Patent Registration helps you to get a patent of an itellectual property right to an invention carried out by an individual or firm. IP department has been initiated by Indian government to grant you the full right to register your invention under patent (but only if it is unique). It also ensures that owner gets more preference over other person for your particular invention.",
      serviceimage: 'assets/images/patentreg.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Professional Tax Registration",
      servicecontent:
          "Professional Tax is the tax levied by the various State Governments of India on salaried individuals working in government or non-government entities, or in practice of any profession, such as CAs, Lawyers, Doctors, etc. or carry out some form of business, are required to pay this professional tax. Professional Tax Registration is done by Indo Law.",
      serviceimage: 'assets/images/taxreg.png',
    ),
    OtherservicesModel(
      servicetitle: "Propety Possession Delay-NCLT",
      servicecontent:
          "If the real estate company is in poor Financial condition and is unable to continue or finish the concerned real estate project, home buyers can initiate insolvency proceedings, sending a legal notice  to the builder serves as a final warning. In case a settlement is still not reached, you  should then file the application for initiating insolvency process. Property Possession Delay-NCLT ",
      serviceimage: 'assets/images/nclt.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Propety Possession Delay-RERA",
      servicecontent:
          "RERA(Real Estate Regulatory Authority)is an act for the regulation and promotion of the real estate sector to ensure the sale of apartment, plot or building in an efficient and transparent manner. It is a dedicated court for the real estate sector and has a fact case_resolution rate. RERA exists to protect the interests of home-Buyers in India. Property Possession Delay-RERA.",
      serviceimage: 'assets/images/rera2.jpg',
    ),
    OtherservicesModel(
      servicetitle: "ROC Compliances",
      servicecontent:
          "ROC stands for Registrar of Companies which is an office under the Indian Ministry of corporate affairs that deal with the administration of the Companies Act, 2013. The office of ROC functions as registry records, related to the companies registered with them, which are available for inspection by members of public on payment of the prescribed fee. ",
      serviceimage: 'assets/images/roc.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Trade License",
      servicecontent:
          "If the real estate company is in poor Trade License is a certificate/document which grants the permission to carry on a particular trade or business for which it is issued.  The License Department is the authorized department by the municipal corporations which issues licenses in consultation with other specialized consultative departments",
      serviceimage: 'assets/images/tradeli.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Trademark Assignment",
      servicecontent:
          "A trademark is any unique expression related to a product or service that distinguishes it from others.A trademark can be easily assigned from one authorized person to other. If a person wants to transfer his/her trademark or wants to shift the ownership of the trademark, then it can be done easily with a Trademark Assignment.",
      serviceimage: 'assets/images/tradeassignment.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Trademark Objection",
      servicecontent:
          "A trademark is any unique expression related to a product or service that distinguishes it from others. This expression could be a word, slogan, photograph, logo, graphic, colour combination, sound or even smell.",
      serviceimage: 'assets/images/tradeobj.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Trademark Registration",
      servicecontent:
          "A trademark is a “brand name” or “logo” that helps you protect the identity of your business. To restrict others from using your brand name or logo, Legal Clinics will help you register your trademark through an expert trademark lawyer. Trademark registration online is done by Indo Law.",
      serviceimage: 'assets/images/tradereg.jpg',
    ),
    OtherservicesModel(
      servicetitle: "Trademark Renewal",
      servicecontent:
          "A trademark is any unique expression related to a product or service that distinguishes it from others.  So, the Registrar informs them regarding the same 6 months before expiration. Still, if there is no action from your side, then Registrar issues a statement which says that your trademark would be removed from Trade Marks Journal.",
      serviceimage: 'assets/images/trademarkrenewal.jpg',
    ),
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
            "ILA Services",
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
                              servicetitle:
                                  otherservicemodel[index].servicetitle,
                              servicecontent:
                                  otherservicemodel[index].servicecontent,
                              serviceimage:
                                  otherservicemodel[index].serviceimage,
                            ))));
          },
        ),
      ),
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

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => OtherServicesform()));
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
                            Row(
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
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.call_sharp,
                                  color: navy,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+ 044-516-7439",
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color: navy),
                                  textAlign: TextAlign.justify,
                                  textScaleFactor: 1,
                                ),
                              ],
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
                                  String name = _namecontroller.text;
                                  String email = _emailcontroller.text;
                                  String address = _addresscontroller.text;
                                  String gender = gendertry;
                                  String mobile = _mobilecontroller.text;
                                  String service = _servicecontroller.text;

                                  FormModel forms = await submitdata(name,
                                      gender, email, address, mobile, service);
                                  setState(() {
                                    _formModel = forms;
                                    Navigator.of(context).pop();

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Submitted"),
                                    ));
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
  var response = await http
      .post(Uri.parse("http://api.indolawassociates.com/api/form"), body: {
    "name": name,
    "gender": gender,
    "email": email,
    "address": address,
    "mobile": mobile,
    "service": service,
  });
  final data = response.body;
  return formModelFromJson(data);
  // if (response.statusCode == 201) {

  // } else {
  //   return null;
  // }
}
