import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:sizer/sizer.dart';
import 'package:photo_view/photo_view.dart';
import '../../../UI/constant/constant.dart';
import '../../../UI/pages/MainHomePage.dart';

class Sliderimage extends StatefulWidget {
  // Sliderimage({required this.image});
  // final String image;
  @override
  _SliderimageState createState() => _SliderimageState();
}

class _SliderimageState extends State<Sliderimage> {
  void onback() {
    Navigator.pushReplacementNamed(context, homeroute);
  }

  @override
  void dispose() {
    getslider();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07.h,
      width: MediaQuery.of(context).size.width * 0.32.w,
      // color: Colors.green,
      // height: MediaQuery.of(context).size.height * 0.04.h,
      // width: MediaQuery.of(context).size.width * 0.3.w,
      // // child: Hero(
      // //     tag: "slider${widget.image}",
      // child: CachedNetworkImage(imageUrl: widget.image)
      child: FutureBuilder(
        future: getslider(),
        // initialData: InitialData,
        builder: (BuildContext context,
            AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
              color: white,
            ));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot<Map<String, dynamic>> slider =
                  snapshot.data![index];
              Map<String, dynamic>? fetchimage = slider.data();
              final image = fetchimage!["images"];
              return Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.035.h,
                  width: MediaQuery.of(context).size.width * 0.3.w,
                  // child: Hero(
                  //     tag: "slider${widget.image}",
                  // child: PhotoView(backgroundDecoration: BoxDecoration(color: white),
                  //     imageProvider: NetworkImage(
                  //   image,
                  // )),
                  child: InkWell(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ZOomimage(
                                    image: image,
                                  ))),
                      child: CachedNetworkImage(imageUrl: image)));
            },
          );

          // Container(
          //           // color: Colors.green,
          //           height: MediaQuery.of(context).size.height * 0.04.h,
          //           width: MediaQuery.of(context).size.width * 0.3.w,
          //           // child: Hero(
          //           //     tag: "slider${widget.image}",
          //           child: CachedNetworkImage(imageUrl: widget.image));
        },
      ),
    );
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getslider() async {
    FirebaseFirestore silder = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await silder.collection("Club Membership").get();
    return snapshot.docs;
  }
}

class ZOomimage extends StatefulWidget {
  final String image;

  ZOomimage({required this.image});

  // ignore: empty_constructor_bodies
  @override
  State<ZOomimage> createState() => _ZOomimageState();
}

class _ZOomimageState extends State<ZOomimage> {
  void onback() {
    Navigator.pushReplacementNamed(context,offerroute);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.035.h,
        width: MediaQuery.of(context).size.width * 0.3.w,
        child: PhotoView(imageProvider: NetworkImage(widget.image)),
      ),
    );
  }
}
