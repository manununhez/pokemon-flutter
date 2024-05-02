// Replace (de)serialization using jsonSerialization https://bloclibrary.dev/tutorials/flutter-weather/

class PokemonDTO {
  int? id;
  String? name;
  SpritesEntry? sprites;
  List<StatEntry>? stats;
  List<TypeEntry>? types;

  PokemonDTO({this.id, this.name, this.sprites, this.stats, this.types});

  factory PokemonDTO.fromJson(Map<String, dynamic> json) {
    return PokemonDTO(
      id: json['id'],
      name: json['name'],
      sprites: json['sprites'] != null
          ? SpritesEntry.fromJson(json['sprites'])
          : null,
      stats: json['stats'] != null
          ? List<StatEntry>.from(
              json['stats'].map((x) => StatEntry.fromJson(x)))
          : null,
      types: json['types'] != null
          ? List<TypeEntry>.from(
              json['types'].map((x) => TypeEntry.fromJson(x)))
          : null,
    );
  }
}

class SpritesEntry {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  SpritesEntry({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory SpritesEntry.fromJson(Map<String, dynamic> json) {
    return SpritesEntry(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
    );
  }
}

class StatEntry {
  int? baseStat;
  int? effort;
  Stat? stat;

  StatEntry({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatEntry.fromJson(Map<String, dynamic> json) {
    return StatEntry(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: Stat.fromJson(json['stat']),
    );
  }
}

class Stat {
  String? name;
  String? url;

  Stat({
    required this.name,
    required this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json['name'],
      url: json['url'],
    );
  }
}

class TypeEntry {
  int slot;
  Type type;

  TypeEntry({
    required this.slot,
    required this.type,
  });

  factory TypeEntry.fromJson(Map<String, dynamic> json) {
    return TypeEntry(
      slot: json['slot'],
      type: Type.fromJson(json['type']),
    );
  }
}

class Type {
  String name;
  String url;

  Type({
    required this.name,
    required this.url,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      name: json['name'],
      url: json['url'],
    );
  }
}
