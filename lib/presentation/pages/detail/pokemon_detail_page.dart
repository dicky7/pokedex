import 'package:flutter/material.dart';
import 'package:poxedex/presentation/pages/detail/widget/detail_app_bar.dart';
import 'package:poxedex/presentation/pages/detail/widget/white_sheet_widget.dart';
import 'package:poxedex/presentation/widget/custom_loading.dart';
import 'package:poxedex/presentation/widget/custom_network_image.dart';
import 'package:poxedex/utils/extension/extension.dart';
import 'package:poxedex/utils/state_enum.dart';
import 'package:poxedex/utils/styles/styles.dart';
import 'package:provider/provider.dart';

import '../../providers/details/pokemon_detail_provider.dart';

class PokemonDetailPage extends StatefulWidget {
  static const routeName = 'detail';

  final String pokemonName;
  final Color cardColor;
  final String imageUrl;

  const PokemonDetailPage({
    Key? key,
    required this.pokemonName,
    required this.cardColor,
    required this.imageUrl}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<PokemonDetailProvider>(context, listen: false)
        ..getPokemonAbout(widget.pokemonName)
        ..getPokemonDetail(widget.pokemonName)

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PokemonDetailProvider>(
        builder: (context, state, child) {
          if (state.pokemonState == ResultState.Loading) {
            return const CustomLoading();
          } else if (state.pokemonState == ResultState.Success) {
            return Container(
              color: widget.cardColor,
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  // get status bar height and top screen padding
                  SizedBox(height: MediaQuery.of(context).viewPadding.top + 10),
                  DetailAppBar(
                    cardColor: widget.cardColor,
                    pokemonName: state.pokemonDetail.species.name,
                    pokemonId: state.pokemonDetail.id.toString(),
                    pokemonTypes: state.pokemonDetail.types,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          right: -100,
                          child: Image.asset(
                            "assets/pokeball.png",
                            width: context.width(0.55),
                            height: context.width(0.55),
                            color: kWhiteGrey,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: WhiteSheetWidget(pokemonDetail: state.pokemonDetail),
                        ),
                        SizedBox(
                          height: context.height(0.33),
                          width: double.infinity,
                          child: CustomNetworkImage(
                            imageUrl: widget.imageUrl,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state.pokemonState == ResultState.Error) {
            return Center(child: Text(state.message));
          } else{
            return SizedBox();
          }

        },
      ),
    );
  }
}
