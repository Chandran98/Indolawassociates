import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/provider/location_provider.dart';
import 'package:indolawassociates/UI/routes/route.dart';
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
      body: Column(
        children: [
          Container(
            child: Center(
              child: FlatButton(
                onPressed: () async {
                  await area.getcurrentlocation();
                  if (area.permissionallowed == true) {
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
          // Container(
          //                         child: Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                           horizontal: 10.0),
          //                       child: TextFormField(
          //                         // enabled: !isLoading,
          //                         keyboardType: TextInputType.streetAddress,
          //                         controller: locationController,
          //                         textInputAction: TextInputAction.done,
          //                         onFieldSubmitted: (_) => node.unfocus(),
          //                         decoration: InputDecoration(
          //                             // floatingLabelBehavior:
          //                             //     FloatingLabelBehavior.never,
          //                             prefixIcon: Icon(
          //                               Icons.location_pin,
          //                               color: navy,
          //                             ),
          //                             labelText: "Location",
          //                             hintText: "Location",
          //                             labelStyle: demofont),
          //                         validator: MultiValidator([
          //                           RequiredValidator(errorText: addressnull),
          //                         ]),
          //                       ),
          //                     )),

          InkWell(
              onTap: () async {
                await area.getcurrentlocation();
                if (area.permissionallowed == true) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Mapscreen()));
                } else {
                  print("Not allowd");
                }
              },
              child: Container(
                color: green,
                height: 200,
                width: 350,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.location,
                      color: white,
                    ),
                    Container(
                height: 200,
                width: 400,
                      child: AutoSizeText(
                        area.selectedAddress.toString(),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ))
        ],
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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, homeroute);
            },
            icon: Icon(Icons.ad_units)),
      ),
      body: Center(
        child: Text(
            "${area.latitude} ${area.longitude} \n${area.selectedAddress.toString()} "),
      ),
    );
  }
}
