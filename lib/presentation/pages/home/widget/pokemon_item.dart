import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:poxedex/presentation/widget/custom_network_image.dart';
import 'package:poxedex/utils/extension/extension.dart';
import 'package:poxedex/utils/helpers/helpers.dart';
import 'package:poxedex/utils/styles/styles.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kRedColor
      ),
      child: Stack(
        children: [
          _buildPokeballDecoration(context),
          _buildPokemon(context),
          _buildPokemonNumber(),
          _buildPokemonContent()
        ],
      ),
    );
  }

  // decoration pokeball
  Widget _buildPokeballDecoration(BuildContext context) {
    final pokeballSize = context.height(0.76);

    return Positioned(
      bottom: -pokeballSize * 0.08,
      right: -pokeballSize *0.04,
      child: Image.asset(
        'assets/pokeball.png',
        width: context.width(0.33),
        height: context.width(0.33),
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildPokemonNumber() {
    final Faker faker = Faker();
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        '#012',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black12,
        ),
      ),
    );
  }

  Widget _buildPokemon(BuildContext context) {
    final pokemonSize = context.height(0.76);
    return Positioned(
      bottom: 4,
      right: 3,
      child: CustomNetworkImage(
        imageUrl: Helpers.randomPictureUrl(),
        radius: context.width(0.23),
      ),
    );
  }

  Widget _buildPokemonContent(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Hero(
              tag: 'pokemon.number + pokemon.name',
              child: Text(
                'pokemon.name',
                style: TextStyle(
                  fontSize: 14,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
