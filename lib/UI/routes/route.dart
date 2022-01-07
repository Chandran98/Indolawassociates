// ignore_for_file: equal_keys_in_map


import 'package:indolawassociates/UI/dummy/Mapping.dart';
import 'package:indolawassociates/UI/pages/Login/loginpage.dart';
import 'package:indolawassociates/UI/pages/Servicepage/NRI.dart';
import 'package:indolawassociates/UI/pages/Servicepage/Paralegal/paralegal.dart';
import 'package:indolawassociates/UI/pages/Servicepage/otherservices/otherservicespage.dart';
import 'package:indolawassociates/UI/pages/Settingspage/careers/careerspage.dart';
import 'package:indolawassociates/UI/pages/Settingspage/contactpage.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/pages/notification.dart';
import 'package:indolawassociates/UI/pages/Settingspage/offer.dart';
import 'package:indolawassociates/UI/pages/Settingspage/profilepage.dart';
import 'package:indolawassociates/UI/pages/signup/signup.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';
import 'package:indolawassociates/UI/pages/Servicepage/services.dart';


const String settingsroute = "/settings";
const String careersroute = "/careers";
const String contactroute = "/contact";
const String nriroute = "/nri";
const String offerroute = "/offers";
const String loginpageroute = "/loginpage";
const String homeroute = "/Homepage";
const String otherserviceroute = "/otherservices";
const String notificationroute = "/notification";
const String signuproute = "/signup";
const String paralegalroute = "/paralegal";
const String legalformroute = "/legalpage";
const String servicespage = "/servicesall";
const String maps = "/maps";


final routes = {
  settingsroute: (context) => Settingspage(),
  careersroute: (context) => Careerspage(),
  contactroute: (context) => Contactpage(),
    // maps: (context) => Mappingposition(),

  // nriroute: (context) => NRIsection(),
  offerroute: (context) => Offersub(),
  loginpageroute: (context) => Loginscreen(),
  homeroute: (context) => MainHomepage(),
  otherserviceroute: (context) => OtherServicesformre(),
  nriroute: (context) => NRIsection(),
  notificationroute: (context) => Notificationpage(),
  signuproute: (context) => Signuppage(),
  paralegalroute: (context) => TParalegal(),
  legalformroute: (context) => Legalinfo(),
  servicespage: (context) => Servicesall(),
};
