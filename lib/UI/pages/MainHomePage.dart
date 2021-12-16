import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/pages/Paralegal/paralegal.dart';
import 'package:indolawassociates/UI/pages/Redesign.dart';
import 'package:indolawassociates/UI/pages/legalforms/formsinfo.dart';
import 'package:indolawassociates/UI/pages/profilepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainHomepage extends StatefulWidget {
  MainHomepage({Key? key}) : super(key: key);

  @override
  _MainHomepageState createState() => _MainHomepageState();
}

class _MainHomepageState extends State<MainHomepage>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List<Widget> pages = [CloneHOME(), TParalegal(), Legalinfo(), Settingspage()];

  void onback() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainHomepage()));
  }
  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return SafeArea(
      child: Scaffold(
          body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: pages),
          bottomNavigationBar: SizedBox(
            height: kBottomNavigationBarHeight,
            child: BottomAppBar(
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  indicator: const UnderlineTabIndicator(
                      insets: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  labelColor: black,
                  unselectedLabelColor: Colors.grey,
                  controller: tabController,
                  tabs: [
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.home),
                      // icon: selectedIndex == 0
                      //     ? const Icon(Icons.home)
                      //     : const Icon(Icons.home_mini),
                      child: Text(
                        translate!.navkey1,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(
                        CupertinoIcons.list_bullet,
                        // size: 25.w,
                      ),
                      child: Text(
                        translate.navkey2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.shield_lefthalf_fill),
                      child: Text(
                        translate.navkey3,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.only(bottom: 4),
                      icon: Icon(CupertinoIcons.profile_circled),
                      child: FittedBox(
                        child: Text(
                          translate.profile,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}