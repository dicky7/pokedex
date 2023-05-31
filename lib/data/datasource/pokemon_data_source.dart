import 'dart:convert';

import 'package:poxedex/data/models/pokemon_about_model.dart';
import 'package:poxedex/data/models/pokemon_detail_model.dart';

import '../../utils/exception_handling/exception.dart';
import '../models/pokemon_basic_model.dart';
import 'package:http/http.dart' as http;

abstract class PokemonDataSource {
  Future<PokemonBasicModel> getPokemonBasic();
  Future<PokemonDetailModel> getPokemonByName(String name);
  Future<PokemonAboutModel> getPokemonAboutByName(String name);
  String pokemonImage(String pokemonId);
}

class PokemonDataSourceImpl extends PokemonDataSource {
  final http.Client client;

  PokemonDataSourceImpl(this.client);

  @override
  Future<PokemonBasicModel> getPokemonBasic() async {
    try {
      final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'));
      if (response.statusCode == 200) {
        return PokemonBasicModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException("Failed to load pokemon list");
      }
    }catch(e){
      throw ServerException(e.toString());
    }
  }

  @override
  Future<PokemonDetailModel> getPokemonByName(String name) async {
    try {
      // convert the pokemon name to lower case so we can use it in the url
      String pokemonNameLowerCase = name.toLowerCase();

      final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonNameLowerCase'));
      if (response.statusCode == 200) {
        return PokemonDetailModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException("Failed to load pokemon Detail");
      }
    }catch(e){
      throw ServerException(e.toString());
    }
  }
  @override
  Future<PokemonAboutModel> getPokemonAboutByName(String name) async{
    try {
      // convert the pokemon name to lower case so we can use it in the url
      String pokemonNameLowerCase = name.toLowerCase();

      final response = await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$pokemonNameLowerCase'));
      if (response.statusCode == 200) {
        return PokemonAboutModel.fromJson(json.decode(response.body));
      } else {
        throw ServerException("Failed to load pokemon About");
      }
    }catch(e){
      throw ServerException(e.toString());
    }
  }


  @override
  String pokemonImage(String pokemonId) {
    String url = "'https://assets.pokemon.com/assets/cms2/img/pokedex/full/$pokemonId.png'";
    return url;
  }
}