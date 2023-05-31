
class PokemonAboutModel {
  final int baseHappiness;
  final int captureRate;
  final List<GrowthRate> eggGroups;
  final List<FlavorTextEntry> flavorTextEntries;
  final GrowthRate growthRate;
  final GrowthRate habitat;

  PokemonAboutModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.eggGroups,
    required this.flavorTextEntries,
    required this.growthRate,
    required this.habitat,
  });

  factory PokemonAboutModel.fromJson(Map<String, dynamic> json) => PokemonAboutModel(
    baseHappiness: json["base_happiness"],
    captureRate: json["capture_rate"],
    eggGroups: List<GrowthRate>.from(json["egg_groups"].map((x) => GrowthRate.fromJson(x))),
    flavorTextEntries: List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
    growthRate: GrowthRate.fromJson(json["growth_rate"]),
    habitat: GrowthRate.fromJson(json["habitat"]),
  );

  Map<String, dynamic> toJson() => {
    "base_happiness": baseHappiness,
    "capture_rate": captureRate,
    "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toJson())),
    "flavor_text_entries": List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
    "growth_rate": growthRate.toJson(),
    "habitat": habitat.toJson(),
  };
}

class GrowthRate {
  final String name;
  final String url;

  GrowthRate({
    required this.name,
    required this.url,
  });

  factory GrowthRate.fromJson(Map<String, dynamic> json) => GrowthRate(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class FlavorTextEntry {
  final String flavorText;

  FlavorTextEntry({
    required this.flavorText,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
    flavorText: json["flavor_text"],
  );

  Map<String, dynamic> toJson() => {
    "flavor_text": flavorText,
  };
}
