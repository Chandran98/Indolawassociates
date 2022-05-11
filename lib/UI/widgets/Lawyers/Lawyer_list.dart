import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/Title_card.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/provider/theme.dart';
import 'package:indolawassociates/UI/services/fireabase_service.dart';
import 'package:indolawassociates/UI/widgets/Lawyers/Lawyer_info_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Toplawyers extends StatefulWidget {
  Toplawyers({Key? key}) : super(key: key);

  @override
  _ToplawyersState createState() => _ToplawyersState();
}

class _ToplawyersState extends State<Toplawyers> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  LawyerDB lawyerDB = LawyerDB();

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
    return Column(
      children: [
        Rowtitle(
          title: translate!.hometitle3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: StreamBuilder<QuerySnapshot>(
            stream: lawyerDB.getlawyerdb(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  color: green,
                ));
              } else {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...snapshot.data!.docs
                          .map((QueryDocumentSnapshot<Object?> doc) {
                        final String name = doc.get("name");
                        final String specialized = doc.get("specialized");
                        final String description = doc.get("description");
                        final String images = doc.get("images");
                        final String area1 = doc.get("area1");
                        final String area2 = doc.get("area2");
                        final String area3 = doc.get("area3");
                        final String area4 = doc.get("area4");
                        final String area5 = doc.get("area5");
                        final String area6 = doc.get("area6");

                        return InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LawyerProfilePage2(
                                        area1: area1,
                                        area2: area2,
                                        area3: area3,
                                        area4: area4,
                                        area5: area5,
                                        area6: area6,
                                        name: name,
                                        specialized: specialized,
                                        description: description,
                                        images: images,
                                      ))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Stack(
                                // alignment: Alignment.topCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 8,
                                        bottom: 20,
                                        right: 10,
                                        left: 10),
                                    decoration: BoxDecoration(
                                        color: context
                                                .watch<Themeprovider>()
                                                .darktheme
                                            ? Colors.grey.shade800
                                            : white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    height: 200,
                                    width: 165,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      name,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              // color: black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Text(
                                                      specialized,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              // color: black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      shape: BoxShape.circle),
                                                  height: 30,
                                                  width: 30,
                                                  child: Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    color: white,
                                                    size: 15,
                                                  ),
                                                ),
                                              )
                                            ])
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    // top: -10,
                                    // left: 60,
                                    child: Container(
                                      height: 110,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(100)),
                                          // shape: BoxShape.circle,
                                          // color: Colors.redAccent,
                                          image: DecorationImage(
                                              image: NetworkImage(images),
                                              fit: BoxFit.cover)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
