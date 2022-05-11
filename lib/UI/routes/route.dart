// ignore_for_file: equal_keys_in_map

import 'package:indolawassociates/UI/pages/Login_screen.dart';
import 'package:indolawassociates/UI/pages/Servicepage/NRI.dart';
import 'package:indolawassociates/UI/pages/Servicepage/Paralegal/paralegal.dart';
import 'package:indolawassociates/UI/pages/Settingspage/Edit_profile_screen.dart';
import 'package:indolawassociates/UI/pages/Careers_screen.dart';
import 'package:indolawassociates/UI/pages/Settingspage/contact_us_screen.dart';
import 'package:indolawassociates/UI/pages/Legalforms_screen.dart';
import 'package:indolawassociates/UI/pages/Notification_screen.dart';
import 'package:indolawassociates/UI/pages/Settingspage/offers_subscription_screen.dart';
import 'package:indolawassociates/UI/pages/Settingspage/Settings_screen.dart';
import 'package:indolawassociates/UI/pages/Signup_screen.dart';
import 'package:indolawassociates/UI/pages/Dashboard_screen.dart';
import 'package:indolawassociates/UI/pages/Servicepage/services.dart';
import 'package:indolawassociates/UI/widgets/otherservices/otherservices_screen.dart';

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
const String editprofile = "/editprofile";

final routes = {
  settingsroute: (context) => Settingscreen(),
  careersroute: (context) => Careerspage(),
  contactroute: (context) => Contactpage(),
  // maps: (context) => Mappingposition(),

  // nriroute: (context) => NRIsection(),
  offerroute: (context) => Offersub(),
  loginpageroute: (context) => Loginscreen(),
  homeroute: (context) => MainHomepage(),
  otherserviceroute: (context) => OtherServicesscreen(),
  nriroute: (context) => NRIsection(),
  notificationroute: (context) => Notificationpage(),
  signuproute: (context) => Signuppage(),
  paralegalroute: (context) => TParalegal(),
  legalformroute: (context) => Legalinfo(),
  servicespage: (context) => Servicesall(),
  editprofile: (context) => Editprofile(),
  
};
