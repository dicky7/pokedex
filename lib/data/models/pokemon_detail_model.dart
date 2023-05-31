// To parse this JSON data, do
//
//     final pokemonDetailModel = pokemonDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PokemonDetailModel pokemonDetailModelFromJson(String str) => PokemonDetailModel.fromJson(json.decode(str));

String pokemonDetailModelToJson(PokemonDetailModel data) => json.encode(data.toJson());

class PokemonDetailModel {
  final List<PokemonAbility> abilities;
  final int baseExperience;
  final int height;
  final int id;
  final List<PokemonMove> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final PokemonSpecies species;
  final List<PokemonStats> stats;
  final List<PokemonType> types;
  final int weight;

  PokemonDetailModel({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) => PokemonDetailModel(
    abilities: List<PokemonAbility>.from(json["abilities"].map((x) => PokemonAbility.fromJson(x))),
    baseExperience: json["base_experience"],
    height: json["height"],
    id: json["id"],
    moves: List<PokemonMove>.from(json["moves"].map((x) => PokemonMove.fromJson(x))),
    name: json["name"],
    order: json["order"],
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    species: PokemonSpecies.fromJson(json["species"]),
    stats: List<PokemonStats>.from(json["stats"].map((x) => PokemonStats.fromJson(x))),
    types: List<PokemonType>.from(json["types"].map((x) => PokemonType.fromJson(x))),
    weight: json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "base_experience": baseExperience,
    "height": height,
    "id": id,
    "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
    "name": name,
    "order": order,
    "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
    "species": species.toJson(),
    "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
    "types": List<dynamic>.from(types.map((x) => x.toJson())),
    "weight": weight,
  };
}

class PokemonAbility {
  final PokemonSpecies ability;
  final bool isHidden;
  final int slot;

  PokemonAbility({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => PokemonAbility(
    ability: PokemonSpecies.fromJson(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toJson() => {
    "ability": ability.toJson(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}

class PokemonSpecies {
  final String name;
  final String url;

  PokemonSpecies({
    required this.name,
    required this.url,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class PokemonMove {
  final PokemonSpecies move;

  PokemonMove({
    required this.move,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> json) => PokemonMove(
    move: PokemonSpecies.fromJson(json["move"]),
  );

  Map<String, dynamic> toJson() => {
    "move": move.toJson(),
  };
}


class PokemonStats {
  final int baseStat;
  final int effort;
  final PokemonSpecies stat;

  PokemonStats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory PokemonStats.fromJson(Map<String, dynamic> json) => PokemonStats(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: PokemonSpecies.fromJson(json["stat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toJson(),
  };
}

class PokemonType {
  final int slot;
  final PokemonSpecies type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
    slot: json["slot"],
    type: PokemonSpecies.fromJson(json["type"]),
  );

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type.toJson(),
  };
}
