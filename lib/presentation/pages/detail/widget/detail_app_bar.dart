import 'package:flutter/material.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';
import 'package:poxedex/presentation/providers/details/pokemon_detail_provider.dart';
import 'package:poxedex/utils/state_enum.dart';
import 'package:poxedex/utils/styles/styles.dart';
import 'package:provider/provider.dart';

class DetailAppBar extends StatelessWidget {
  final Color cardColor;
  final String pokemonId;
  final List<PokemonType> pokemonTypes;
  final String pokemonName;


  const DetailAppBar(
      {Key? key,
        required this.cardColor,
        required this.pokemonId,
        required this.pokemonTypes,
        required this.pokemonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokemonIdPadLeft = '';
    pokemonIdPadLeft = pokemonId.padLeft(3, '0');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemonName,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 5),
              buildTypesPokemon(pokemonTypes),
            ],
          ),
          Text(
            "#$pokemonIdPadLeft",
            style: TextStyle(fontSize: 18, color: kPrimaryColor, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildTypesPokemon(List<PokemonType> types) {
    return Row(
      children: types.map((value) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardColor.withOpacity(0.9),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                value.type.name,
                style: TextStyle(fontSize: 13, color: kPrimaryColor),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

}
