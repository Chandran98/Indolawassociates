import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:indolawassociates/UI/components/List_title_widgets.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Settingspage/Edit_page.dart';
import 'package:indolawassociates/UI/provider/languageprovider.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/provider/user_details_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../routes/route.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Settingscreen extends StatefulWidget {
  const Settingscreen({Key? key}) : super(key: key);

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  void initState() {
    Userprofile();
    super.initState();
  }

  void onback() {
    Navigator.pushNamed(context, homeroute);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Provider.of<Themeprovider>(context);
    final translate = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Profile"),
            actions: [
              IconButton(
                  onPressed: () {
                    theme.toggletheme();
                  },
                  icon: Icon(CupertinoIcons.moon_stars))
            ],
          ),
          body: ListView(
            padding: EdgeInsets.fromLTRB(15, 20, 20, 50),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Userprofile(),
              const Text(
                "General Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              spaced20,
              ListTile(
                  title: Text('Dark mode'),
                  leading: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(CupertinoIcons.moon_stars,
                        size: 20, color: Colors.white),
                  ),
                  trailing: Switch(
                      activeColor: Theme.of(context).primaryColor,
                      value: Provider.of<Themeprovider>(context).darktheme,
                      onChanged: (active) {
                        Provider.of<Themeprovider>(context, listen: false)
                            .toggletheme();
                      })),
              const Divider(
                height: 3,
              ),
              Listtilewidget(
                color: Colors.blueAccent,
                ontap: () {
                  Navigator.pushNamed(context, contactroute);
                },
                icon: FeatherIcons.headphones,
                title: 'Contact us',
              ),
              Listtilewidget(
                color: Colors.pinkAccent,
                ontap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            // backgroundColor: dialog,
                            title: Text(
                              translate!.languagekey,
                              // style: dfont,
                            ),
                            actionsPadding: EdgeInsets.symmetric(horizontal: 2),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<Languagenotifier>()
                                        .changelanguage("en");
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    translate.primarylanguage,
                                    style: TextStyle(color: appcolor),

                                    // style: dfont,
                                  )),
                              TextButton(
                                  onPressed: () {
                                    context
                                        .read<Languagenotifier>()
                                        .changelanguage("ta");
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    translate.language1,
                                    style: TextStyle(color: appcolor),

                                    // style: dfont,
                                  ))
                            ],
                          ));
                },
                icon: FeatherIcons.globe,
                title: 'Language',
              ),
              Listtilewidget(
                color: Colors.orangeAccent,
                ontap: () {
                  launch(
                      "https://play.google.com/store/apps/details?id=com.indolawassociates.Indolaw");
                },
                icon: FeatherIcons.star,
                title: 'Rate this app',
              ),
              Listtilewidget(
                color: Colors.redAccent,
                ontap: () {
                  launch(
                      "https://drive.google.com/file/d/16DRzCPZrXS1EiiU3NFC9ftqkigNaaJYZ/view?usp=sharing");
                },
                icon: FeatherIcons.lock,
                title: 'Privacy policy',
              ),
              Listtilewidget(
                color: Colors.greenAccent,
                ontap: () {
                  launch("https://indolawassociates.com/");
                },
                icon: FeatherIcons.info,
                title: 'About us',
              ),
            ],
          )),
    );
  }
}

class Userprofile extends StatefulWidget {
  const Userprofile({
    Key? key,
  }) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade500,
              ),
              spaced20,
              Text(
                "Richie",
                // authprovider.name.toString(),
                // name== null?  authprovider.name.toString():"Name",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        // Listtilewidget(
        //   title: "email.toString()",
        //   color: Colors.deepPurpleAccent,
        //   icon: FeatherIcons.mail,
        //   ontap: () {},
        // ),
        Listtilewidget(
            title: "Edit profile",
            color: Colors.blueAccent,
            ontap: ()
                // =>Navigator.pushNamed(context, editprofile),
                {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Editprofile()));
            },
            icon: FeatherIcons.edit3),
        Listtilewidget(
            title: "Log out",
            color: Colors.redAccent,
            ontap: () {
              logout(context);
            },
            icon: FeatherIcons.logOut),
        spaced20
      ],
    );
  }

  void logout(_) {
    showDialog(
        context: (_),
        builder: (_) {
          return AlertDialog(
            title: const Text("Do you want to Leave"),
            actions: [
              TextButton(
                  onPressed: () async {
                    await _auth.signOut().then((value) =>
                        Navigator.pushNamed(context, loginpageroute));
                    // await _
                    //     .read<Authprovider>()
                    //     .usersignout()
                    //     .then((value) => _.read<Authprovider>().aftersignout())
                    //     .then((value) {
                    //   Navigator.of(_).pop();
                    //   if (_.read<Themeprovider>().darktheme == true) {
                    //     _.read<Themeprovider>().toggletheme();
                    //   }
                    //   Navigator.pushReplacement(_,
                    //       MaterialPageRoute(builder: (_) => Boardingscreen()));
                    // });
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: appcolor),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(_).pop();
                  },
                  child: Text(
                    "cancel",
                    style: TextStyle(color: appcolor),
                  )),
            ],
          );
        });
  }
}
