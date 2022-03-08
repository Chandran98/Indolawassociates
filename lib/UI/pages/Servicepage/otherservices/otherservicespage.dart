import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:indolawassociates/UI/pages/Servicepage/otherservices/otherservicesinfo.dart';
import 'package:indolawassociates/UI/routes/route.dart';

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

class OtherServicesformre extends StatefulWidget {
  const OtherServicesformre({Key? key}) : super(key: key);

  @override
  _OtherServicesformreState createState() => _OtherServicesformreState();
}

class _OtherServicesformreState extends State<OtherServicesformre> {
  void onback() {
    Navigator.pushNamed(context, servicespage);
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: dialog,
            //   title: Text(
            //     translate!.drawerkey3,
            //     style: GoogleFonts.mulish(
            //         color: white, fontWeight: FontWeight.w500, fontSize: 20.sp),
            //   ),
            //   leading: IconButton(
            //       onPressed: () => Navigator.pushNamed(context, settingsroute),
            //       icon: Image.asset(
            //         "assets/icons/rback.png",
            //         color: white,
            //         height: 35,
            //       )),
            // ),
            body: otherserviceslist(context)),
      ),
    );
  }

  Widget otherserviceslist(context) {
    final translate = AppLocalizations.of(context);

    List<OtherservicesModel> otherservicemodel = [
      OtherservicesModel(
        servicetitle: translate!.otherservicetitle1,
        servicecontent: translate.otherservicessub1,
        serviceimage: 'assets/images/bulk.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle2,
        servicecontent: translate.otherservicessub2,
        serviceimage: 'assets/images/businessincome.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle3,
        servicecontent: translate.otherservicessub3,
        serviceimage: 'assets/images/capitalofimage.jpeg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle4,
        servicecontent: translate.otherservicessub4,
        serviceimage: 'assets/images/COD.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle5,
        servicecontent: translate.otherservicessub5,
        serviceimage: 'assets/images/regoffice.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle6,
        servicecontent: translate.otherservicessub6,
        serviceimage: 'assets/images/Annual.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle7,
        servicecontent: translate.otherservicessub7,
        serviceimage: 'assets/images/drugli.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle8,
        servicecontent: translate.otherservicessub8,
        serviceimage: 'assets/images/ESIC.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle9,
        servicecontent: translate.otherservicessub9,
        serviceimage: 'assets/images/msme.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle10,
        servicecontent: translate.otherservicessub10,
        serviceimage: 'assets/images/fssai.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle11,
        servicecontent: translate.otherservicessub11,
        serviceimage: 'assets/images/gstreturn.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle12,
        servicecontent: translate.otherservicessub12,
        serviceimage: 'assets/images/incometaxreturn.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle13,
        servicecontent: translate.otherservicessub13,
        serviceimage: 'assets/images/isoreg.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle14,
        servicecontent: translate.otherservicessub14,
        serviceimage: 'assets/images/patentreg.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle15,
        servicecontent: translate.otherservicessub15,
        serviceimage: 'assets/images/taxreg.png',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle16,
        servicecontent: translate.otherservicessub16,
        serviceimage: 'assets/images/nclt.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle17,
        servicecontent: translate.otherservicessub17,
        serviceimage: 'assets/images/rera2.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle18,
        servicecontent: translate.otherservicessub18,
        serviceimage: 'assets/images/roc.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle19,
        servicecontent: translate.otherservicessub19,
        serviceimage: 'assets/images/tradeli.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle20,
        servicecontent: translate.otherservicessub20,
        serviceimage: 'assets/images/tradeassignment.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle21,
        servicecontent: translate.otherservicessub21,
        serviceimage: 'assets/images/tradeobj.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle22,
        servicecontent: translate.otherservicessub22,
        serviceimage: 'assets/images/tradereg.jpg',
      ),
      OtherservicesModel(
        servicetitle: translate.otherservicetitle23,
        servicecontent: translate.otherservicessub23,
        serviceimage: 'assets/images/trademarkrenewal.jpg',
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
            leading: Icon(Icons.logout, ),
            title: Text(
              otherservicemodel[index].servicetitle,
              // style: demofont,
            ),
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => OTherservicesscreen(
                          servicetitle: otherservicemodel[index].servicetitle,
                          servicecontent:
                              otherservicemodel[index].servicecontent,
                          serviceimage: otherservicemodel[index].serviceimage,
                        ))));
      },
    );
  }
}
