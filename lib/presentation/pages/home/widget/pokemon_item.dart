import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:poxedex/data/models/pokemon_basic_model.dart';
import 'package:poxedex/presentation/pages/detail/pokemon_detail_page.dart';
import 'package:poxedex/presentation/widget/custom_loading.dart';
import 'package:poxedex/presentation/widget/custom_network_image.dart';
import 'package:poxedex/utils/extension/extension.dart';
import 'package:poxedex/utils/helpers/helpers.dart';
import 'package:poxedex/utils/styles/styles.dart';

import '../../../../utils/colors_generator.dart';

class PokemonItem extends StatefulWidget {
  final String pokemonName;
  final String imageUrl;
  final String pokemonNumber;

  const PokemonItem({Key? key, required this.pokemonName, required this.imageUrl, required this.pokemonNumber}) : super(key: key);

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  Color cardColor = kTransparentColor;
  bool colorReady = false;

  @override
  void initState() {
    generateContainerColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (colorReady) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(
              context,
              PokemonDetailPage.routeName,
              arguments: PokemonDetailPage(
                  pokemonName: widget.pokemonName,
                  cardColor: cardColor,
                  imageUrl: widget.imageUrl));

        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardColor
          ),
          child: Column(
            children: [
              CustomNetworkImage(
                imageUrl: widget.imageUrl,
                radius: context.height(0.13),
              ),
              Text(
                widget.pokemonName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                  "#${widget.pokemonNumber}",
                  style: TextStyle(color: kGreyColor, fontSize: 17)),
            ],
          ),
        ),
      );
    }else{
      return const CustomLoading();
    }
  }

  Future<void> generateContainerColor() async {
    ColorsGenerator colorsGenerator = ColorsGenerator();
    Color generatedColor =
    await colorsGenerator.generateCardColor(widget.imageUrl, false);
    if (mounted) {
      setState(() {
        colorReady = true;
        cardColor = generatedColor;
      });
    }
  }
}
