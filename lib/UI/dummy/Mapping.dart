import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/provider/location_provider.dart';
import 'package:provider/provider.dart';

class Mappingposition extends StatefulWidget {
  Mappingposition({Key? key}) : super(key: key);

  @override
  _MappingpositionState createState() => _MappingpositionState();
}

class _MappingpositionState extends State<Mappingposition> {
  @override
  Widget build(BuildContext context) {
    final area = Provider.of<Locationprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: FlatButton(
            onPressed: ()async {
              await area.getcurrentlocation();
              if (area.permissionallowed ==true) {
                 Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Mapscreen()));
              } else {
                print("Not allowd");
              }
            },
            child: Text("Location"),
          ),
        ),
      ),
    );
  }
}

class Mapscreen extends StatelessWidget {
  const Mapscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final area = Provider.of<Locationprovider>(context);
    return Scaffold(
      body: Center(
        child: Text("${area.latitude} ${area.longitude} "),
      ),
    );
  }
}
