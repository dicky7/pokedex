import 'package:flutter/material.dart';
import 'package:poxedex/data/repository/pokemon_repository.dart';
import 'package:poxedex/presentation/pages/home/widget/pokemon_item.dart';
import 'package:poxedex/presentation/providers/home/pokemon_providers.dart';
import 'package:poxedex/utils/state_enum.dart';
import 'package:provider/provider.dart';

import '../../../widget/custom_loading.dart';

class CustomSliverGridView extends StatelessWidget {
  const CustomSliverGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProviders>(
      builder: (context, state, child) {
        if (state.pokemonState == ResultState.Loading) {
          return const SliverToBoxAdapter(child: CustomLoading());
        } else if (state.pokemonState == ResultState.Success){
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 200,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final pokemon = state.pokemonList[index];

                  String pokemonIdPadLeft = '';
                  pokemonIdPadLeft = (index + 1).toString().padLeft(3, '0');

                  String imageUrl = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$pokemonIdPadLeft.png';
                  return PokemonItem(
                    pokemonName: pokemon.name,
                    imageUrl: imageUrl,
                    pokemonNumber: pokemonIdPadLeft,
                  );
                },childCount: state.pokemonList.length)
            ),
          );
        }else if(state.pokemonState == ResultState.Error){
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        }else{
          return SizedBox();
        }
      },
    );
  }
}

