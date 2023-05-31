import 'package:flutter/material.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';
import 'package:poxedex/utils/styles/styles.dart';

class MoveView extends StatelessWidget {
  final PokemonDetailModel pokemonDetail;
  
  const MoveView({Key? key, required this.pokemonDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: pokemonDetail.moves.length,
      itemBuilder: (context, index) {
        final move = pokemonDetail.moves[index];
        return Text(
          move.move.name,
          style: TextStyle(color: kBlackColor, fontSize: 16),
        );
      },
    );
  }
}
