class PokemonBasicModel {
  final List<PokemonBasicItem> results;

  PokemonBasicModel({
    required this.results,
  });

  factory PokemonBasicModel.fromJson(Map<String, dynamic> json) => PokemonBasicModel(
    results: List<PokemonBasicItem>.from(json["results"].map((x) => PokemonBasicItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class PokemonBasicItem {
  final String name;
  final String url;

  PokemonBasicItem({
    required this.name,
    required this.url,
  });

  factory PokemonBasicItem.fromJson(Map<String, dynamic> json) => PokemonBasicItem(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
