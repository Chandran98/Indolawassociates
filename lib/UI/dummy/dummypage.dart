import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/constant/constant.dart';

class Custompage extends StatelessWidget {
  const Custompage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: dfont,
        ),
        centerTitle: true,
        backgroundColor: dialog,
        automaticallyImplyLeading: false,
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: white),
          onPressed: () => {Scaffold.of(context).openDrawer()},
        ),
        elevation: 0,
        actions: [Icon(Icons.notifications_active)],
      ),
      body: ListView(
        primary: true,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                color: dialog.withOpacity(0.1),
                height: 150,
                width: double.maxFinite,
                margin: EdgeInsets.only(bottom: 50),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [Text("data"), Text("data@gmail.com")],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: dialog,
                  border: Border.all(color: white,width: 4),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  boxShadow: [
                    BoxShadow(
                        color: dialog.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5)),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    // imageUrl: _currentUser.value.avatar.thumb,
                    placeholder: (context, url) => Image.asset(
                      'assets/img/loading.gif',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 100,
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error_outline),
                    imageUrl: '',
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                    color: dialog.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("data", style: demofont),
                    onTap: (e) {}),
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("Profile", style: demofont),
                    onTap: (e) {}),
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("Mingle", style: demofont),
                    onTap: (e) {}),
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text(
                      "Sinks",
                      style: demofont,
                    ),
                    onTap: (e) {}),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                    color: dialog.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("data", style: demofont),
                    onTap: (e) {}),
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("Profile", style: demofont),
                    onTap: (e) {}),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                    color: dialog.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("data", style: demofont),
                    onTap: (e) {}),
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text("Profile", style: demofont),
                    onTap: (e) {}),
                AccountLinkWidget(
                    icon: Icon(Icons.ac_unit),
                    text: Text(
                      "Sinks",
                      style: demofont,
                    ),
                    onTap: (e) {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AccountLinkWidget extends StatelessWidget {
  final Icon icon;
  final Widget text;
  final ValueChanged<void> onTap;

  AccountLinkWidget(
      {required this.icon, required this.text, required this.onTap, required});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap('');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            icon,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: 1,
              height: 24,
              color: dialog.withOpacity(0.4),
            ),
            Expanded(
              child: text,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: dialog,
            ),
          ],
        ),
      ),
    );
  }
}
