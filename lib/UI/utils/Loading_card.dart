import 'package:flutter/material.dart';

import 'package:skeleton_text/skeleton_text.dart';

class LoadingCard extends StatelessWidget {
  final double? height;
  const LoadingCard({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: SkeletonAnimation(
        child: Container(
          decoration: BoxDecoration(

              // color: context.watch<ThemeBloc>().darkTheme == false ? CustomColor().loadingColorLight : CustomColor().loadingColorDark,
              borderRadius: BorderRadius.circular(5)),
          height: height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
