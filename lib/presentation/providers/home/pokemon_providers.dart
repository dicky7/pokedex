import 'package:flutter/cupertino.dart';
import 'package:poxedex/data/repository/pokemon_repository.dart';
import 'package:poxedex/utils/state_enum.dart';

import '../../../data/models/pokemon_basic_model.dart';

class PokemonProviders extends ChangeNotifier {
  final PokemonRepository repository;

  PokemonProviders(this.repository){
    getPokemonList();
  }

  ResultState _pokemonState = ResultState.Initial;
  ResultState get pokemonState => _pokemonState;

  List<PokemonBasicItem> _pokemonList = [];
  List<PokemonBasicItem> get pokemonList => _pokemonList;

  String _message = "";
  String get message => _message;

  Future<void> getPokemonList() async {
    _pokemonState = ResultState.Loading;
    notifyListeners();

    final result = await repository.getPokemonBasic();
    result.fold(
      (error) {
        _pokemonState = ResultState.Error;
        notifyListeners();
        return _message = error.message;
      },
       (success) {
        _pokemonState = ResultState.Success;
        notifyListeners();
        return _pokemonList = success;
      },
    );
  }

  String pokemonImage(String pokemonId) {
    return repository.pokemonImage(pokemonId);
  }
}