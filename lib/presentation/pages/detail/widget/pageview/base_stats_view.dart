import 'package:flutter/material.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';
import 'package:poxedex/presentation/pages/detail/widget/pageview/widget/stat_bar_widget.dart';

class BaseStatsView extends StatelessWidget {
  final PokemonDetailModel pokemonDetail;

  const BaseStatsView({Key? key, required this.pokemonDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: pokemonDetail.stats.length,
      itemBuilder: (context, index) {
        final stats = pokemonDetail.stats[index];
        return StatBarWidget(
            statTitle: stats.stat.name,
            statNumber: stats.baseStat
        );
      },
    );
  }
}
