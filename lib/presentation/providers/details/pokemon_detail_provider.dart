import 'package:flutter/cupertino.dart';
import 'package:poxedex/data/models/pokemon_about_model.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';
import 'package:poxedex/data/repository/pokemon_repository.dart';
import 'package:poxedex/utils/state_enum.dart';

class PokemonDetailProvider extends ChangeNotifier{
  final PokemonRepository repository;

  PokemonDetailProvider(this.repository);

  ResultState _pokemonState = ResultState.Initial;
  ResultState get pokemonState => _pokemonState;

  late PokemonDetailModel _pokemonDetail;
  PokemonDetailModel get pokemonDetail => _pokemonDetail;

  late PokemonAboutModel _pokemonAbout;
  PokemonAboutModel get pokemonAbout => _pokemonAbout;

  String _message = "";
  String get message => _message;

  Future<void> getPokemonDetail(String name) async{
    _pokemonState = ResultState.Loading;
    notifyListeners();

    final result = await repository.getPokemonDetail(name);
    result.fold(
      (error) {
        _pokemonState = ResultState.Error;
        notifyListeners();
        return _message = error.message;
      },
      (success) {
        _pokemonState = ResultState.Success;
        notifyListeners();
        return _pokemonDetail = success;
      },
    );
  }

  Future<void> getPokemonAbout(String name) async{
    final result = await repository.getPokemonAbout(name);
    result.fold(
      (error) {
        _pokemonState = ResultState.Error;
        notifyListeners();
        return _message = error.message;
      },
      (success) {
        _pokemonAbout = success;
        notifyListeners();
      },
    );
  }
}