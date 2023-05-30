import 'package:flutter/material.dart';
import 'package:poxedex/presentation/pages/home/widget/pokemon_item.dart';

class CustomSliverGridView extends StatelessWidget {
  const CustomSliverGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          delegate: SliverChildBuilderDelegate((context, index){
            return PokemonItem();

          },childCount: 15,)
      ),
    );
  }
}
