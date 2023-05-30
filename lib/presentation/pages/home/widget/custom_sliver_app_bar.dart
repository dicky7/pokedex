import 'package:flutter/material.dart';
import 'package:poxedex/utils/extension/extension.dart';

import '../../../../utils/styles/styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double mainAppbarPadding = 28;
    double height = kToolbarHeight + mainAppbarPadding * 2;

    return SliverAppBar(
      backgroundColor: kTransparentColor ,
      expandedHeight: height,
      elevation: 0,
      pinned: false,
      floating: false,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Pokedex',
          style: TextStyle(color: kBlackColor),
        ),
        collapseMode: CollapseMode.parallax,
        titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
      ),
    );
  }
}
