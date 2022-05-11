import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indolawassociates/UI/cards/lawyerprofile.dart';
import 'package:indolawassociates/UI/components/customcache_image.dart';
import 'package:indolawassociates/UI/models/lawyers_model.dart';


class Card4 extends StatelessWidget {
  final Lawyermodel d;
  final String herotag;
  const Card4({
    Key? key,
    required this.d,
    required this.herotag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => LawyerProfilePage(
                      d: d,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 90,
                      width: 90,
                      child: Hero(
                          tag: herotag,
                          child:
                              CustomCacheImage(imageUrl: d.images, radius: 5.0))),

                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        d.name!,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.time_solid,
                            color: Colors.grey[400],
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            d.specialized!,
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 13),
                          ),
                          Spacer(),
                          Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          // Text(d.experience!,
                          //     style: TextStyle(
                          //         color: Theme.of(context).secondaryHeaderColor,
                          //         fontSize: 13)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
