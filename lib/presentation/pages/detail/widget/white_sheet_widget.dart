import 'package:flutter/material.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/base_stats_view.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/detail_about_view.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/more_info_view.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/move_view.dart';
import 'package:poxedex/utils/extension/extension.dart';
import 'package:poxedex/utils/styles/styles.dart';

import '../../../../data/models/pokemon_about_model.dart';
import '../../../../data/models/pokemon_detail_model.dart';

class WhiteSheetWidget extends StatefulWidget {
  final PokemonDetailModel pokemonDetail;
  final PokemonAboutModel pokemonAbout;

  WhiteSheetWidget({Key? key, required this.pokemonDetail, required this.pokemonAbout}) : super(key: key);

  @override
  State<WhiteSheetWidget> createState() => _WhiteSheetWidgetState();
}

class _WhiteSheetWidgetState extends State<WhiteSheetWidget> {
  final _tabController = PageController();

  int _currentTabIndex = 0;

  bool loading = false;

  final List<String> _tabs = ['About', 'Base Stats', 'Moves', 'More Info'];

  @override
  Widget build(BuildContext context) {

    return Container(
      height: context.height(0.6),
      width: context.width(1),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          //adding some space
          SizedBox(
            height: context.height(0.065),
          ),
          SizedBox(
            height: context.height(.06),
            child: Center(child: customScrollerBuilder()),
          ),
          Expanded(
            child: PageView(
              controller: _tabController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (int index) {
                setState(() {
                  // update the tab index
                  _currentTabIndex = index;
                });
              },
              children: [
                DetailAboutView(pokemonAbout: widget.pokemonAbout, pokemonDetail: widget.pokemonDetail),
                BaseStatsView(pokemonDetail: widget.pokemonDetail),
                MoveView(pokemonDetail: widget.pokemonDetail),
                MoreInfoView(pokemonAbout: widget.pokemonAbout)

              ],

            ),
          )
        ],
      ),
    );
  }

  Widget customScrollerBuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ..._tabs.map((tab) {
          int tabIndex = _tabs.indexOf(tab);
          return Expanded(child: tabBuilder(tabIndex, _tabs));
        }).toList(),
      ],
    );
  }

  Widget tabBuilder(int tabIndex, List<String> scrollTabs) {
    return GestureDetector(
      onTap: () {
        updateTabIndex(tabIndex);
      },
      child: Column(
        children: [
          Text(
              scrollTabs[tabIndex],
              style: TextStyle(fontWeight: FontWeight.bold, color: kGreyColor)),
          if (tabIndex == _currentTabIndex)
            Container(
              width: scrollTabs[tabIndex].length * 10,
              height: 2,
              color: kBlackColor,
            ),
        ],
      ),
    );
  }

  void updateTabIndex(int tabIndex) {
    setState(() {
      _currentTabIndex = tabIndex;
      // add animation
      _tabController.animateToPage(tabIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });
  }
}
