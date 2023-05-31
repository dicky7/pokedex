import 'package:flutter/material.dart';
import 'package:poxedex/data/models/pokemon_about_model.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/widget/title_and_subtitle_widget.dart';

class MoreInfoView extends StatelessWidget {
  final PokemonAboutModel pokemonAbout;
  const MoreInfoView({Key? key, required this.pokemonAbout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        TitleAndSubtitleWidget(title: "Growth Rate", subtitle: pokemonAbout.growthRate.name),
        TitleAndSubtitleWidget(title: "Capture Rate", subtitle: "${pokemonAbout.captureRate.toString()} %"),
        TitleAndSubtitleWidget(title: "Base Happiness", subtitle: "${pokemonAbout.baseHappiness} point"),
      ],
    );
  }
}
