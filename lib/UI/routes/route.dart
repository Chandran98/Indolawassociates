// ignore_for_file: equal_keys_in_map


import 'package:indolawassociates/UI/pages/Login/loginpage.dart';
import 'package:indolawassociates/UI/pages/NRI.dart';
import 'package:indolawassociates/UI/pages/Paralegal/paralegal.dart';
import 'package:indolawassociates/UI/pages/careerspage.dart';
import 'package:indolawassociates/UI/pages/contactpage.dart';
import 'package:indolawassociates/UI/pages/legalforms/legalforms_page.dart';
import 'package:indolawassociates/UI/pages/notification.dart';
import 'package:indolawassociates/UI/pages/offer.dart';
import 'package:indolawassociates/UI/pages/otherservices/otherservicespage.dart';
import 'package:indolawassociates/UI/pages/profilepage.dart';
import 'package:indolawassociates/UI/pages/signup/signup.dart';
import 'package:indolawassociates/UI/pages/MainHomePage.dart';

const String settingsroute = "/settings";
const String careersroute = "/settings";
const String contactroute = "/settings";
const String nriroute = "/settings";
const String offerroute = "/settings";
const String loginpageroute = "/loginpage";
const String homeroute = "/Homepage";
const String otherserviceroute = "/otherservices";
const String notificationroute = "/notification";
const String signuproute = "/signup";
const String paralegalroute = "/paralegal";
const String legalformroute = "/legalpage";
// const String otherserviceroute = "/otherservices";

final routes = {
  settingsroute: (context) => Settingspage(),
  careersroute: (context) => Careerspage(),
  contactroute: (context) => Contactpage(),
  nriroute: (context) => NRIsection(),
  offerroute: (context) => Offersub(),
  loginpageroute: (context) => DemoLogin(),
  homeroute: (context) => MainHomepage(),
  otherserviceroute: (context) => OtherServicesformre(),
  nriroute: (context) => NRIsection(),
  notificationroute: (context) => Notificationpage(),
  signuproute: (context) => Demosignup(),
  paralegalroute: (context) => TParalegal(),
  legalformroute: (context) => Legalinfo(),
  // offerroute: (context) => Offersub(),
};
