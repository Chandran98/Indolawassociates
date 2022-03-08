// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Listtilewidget extends StatelessWidget {
  String title;
  IconData icon;
  VoidCallback ontap;

  Color color;
  Listtilewidget(
      {Key? key,
      required this.title,
      required this.color,
      required this.icon,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title),
          leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5)),
            child: Icon(icon, size: 20, color: Colors.white),
          ),
          trailing: const Icon(
            FeatherIcons.chevronRight,
            size: 20,
          ),
          onTap: ontap,
        ),
        const Divider(
          height: 3,
        )
      ],
    );
  }
}
