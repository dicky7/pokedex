import 'package:flutter/material.dart';
import 'package:poxedex/data/models/pokemon_about_model.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/widget/title_and_subtitle_widget.dart';
import 'package:poxedex/utils/extension/extension_converter.dart';
import 'package:poxedex/utils/styles/styles.dart';

class DetailAboutView extends StatelessWidget {
  final PokemonAboutModel pokemonAbout;
  final PokemonDetailModel pokemonDetail;

  const DetailAboutView({Key? key, required this.pokemonAbout, required this.pokemonDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String description = pokemonAbout.flavorTextEntries[0].flavorText.replaceAll(RegExp('\n'), '');

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: [
        TitleAndSubtitleWidget(title: "Description", subtitle: description),
        const SizedBox(height: 5),
        itemAbout("Habitat", pokemonAbout.habitat.name),
        itemAbout("Height", convertCmToFeet(pokemonDetail.height)),
        const SizedBox(height: 5),
        itemAbout("Weight", convertKgToPound(pokemonDetail.weight)),
        const SizedBox(height: 5),
        itemAbout("Abilities", pokemonDetail.abilities.map((e) => e.ability.name).toList().join(', ')),
        const SizedBox(height: 5),
        itemAbout("Egg Group", pokemonAbout.eggGroups.map((e) => e.name).toList().join(', ')),
        const SizedBox(height: 8),
        const Divider(height: 5),
        const SizedBox(height: 8),


      ],
    );
  }

  Widget itemAbout(String title, String subtitle){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: kGreyColor, fontSize: 16),
          ),
        ),

        Expanded(
          flex: 3,
          child: Text(
            subtitle,
            style: TextStyle(color: kBlackColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

      ],
    );
  }


}
