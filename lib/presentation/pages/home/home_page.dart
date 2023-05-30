import 'package:flutter/material.dart';
import 'package:poxedex/presentation/pages/home/widget/custom_sliver_app_bar.dart';
import 'package:poxedex/presentation/pages/home/widget/custom_sliver_grid_view.dart';
import 'package:poxedex/utils/extension/extension.dart';
import 'package:poxedex/utils/styles/styles.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  int offset = 0;
  bool atBottom = false;
  bool loadData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        body: Stack(fit: StackFit.expand, children: [
          Positioned(
            top: -10,
            right: -100,
            child: Image.asset(
              "assets/pokeball.png",
              width: context.width(0.55),
              height: context.width(0.55),
              color: kWhiteGrey,
            ),
          ),
          CustomScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              CustomSliverAppBar(),
              CustomSliverGridView()
            ],
          )
        ])
    );
  }
}
