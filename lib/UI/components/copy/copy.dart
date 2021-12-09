import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  int current = 0;

  List<Data> data = [
    Data(0,
        "https://img.freepik.com/free-photo/milford-sound-new-zealand-travel-destination-concept_53876-42945.jpg"),
    Data(0,
        "https://watchandlearn.scholastic.com/content/dam/classroom-magazines/watchandlearn/videos/animals-and-plants/plants/what-are-plants-/What-Are-Plants.jpg"),
    Data(0,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc7drAdH_rr-5-s1dR37nexpspDiygTjd_eg&usqp=CAU"),
    Data(0, "https://images-na.ssl-images-amazon.com/images/I/51Gguy1yh9L.jpg"),
    Data(0,
        "https://nestreeo.com/wp-content/uploads/2020/03/Pyrostegia_venusta.jpg"),
    Data(0,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW7IvtmZDCGOoFuqg5s7QWSX7sWpf3bqZcsQ&usqp=CAU"),
    Data(0, "https://images-na.ssl-images-amazon.com/images/I/51Gguy1yh9L.jpg"),
    Data(0,
        "https://nestreeo.com/wp-content/uploads/2020/03/Pyrostegia_venusta.jpg"),
    Data(0,
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW7IvtmZDCGOoFuqg5s7QWSX7sWpf3bqZcsQ&usqp=CAU"),
  ];

  Widget _buildItemList(BuildContext context, int index) {
    return Container(
      width: 200,
      child: Center(
        child: Container(
          height: 200,
          child: Card(
            elevation: 10,
            child: Container(
              width: 200,
              height: 250,
              child: Image.network(
                data[index].path,
                scale: 1,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    current = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ScrollSnapList(
              itemBuilder: _buildItemList,
              onItemFocus: (pos) {
                setState(() {
                  current = pos;
                });
                print('Done! $pos');
              },
              itemSize: 200,
              dynamicItemSize: true,
              onReachEnd: () {
                print('Done!');
              },
              itemCount: data.length,
            )),
           
          ],
        ),
      ),
    );
  }
}

class Data {
  int count;
  String path;
  Data(this.count, this.path);
}
