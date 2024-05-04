import 'package:flutter/material.dart';

class Pokemon {
  String id;
  String name;
  String image;
  PokemonStats stats;
  PokemonType type;

  Pokemon(
      {required this.id,
      required this.name,
      required this.image,
      required this.stats,
      required this.type});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        stats: PokemonStats.fromJson(json['stats']),
        type: PokemonType.fromJson(json['type']));
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'stats': stats.toJson(),
      'type': type.toJson()
    };
  }
}

class PokemonStats {
  String attack;
  String hp;
  String defense;

  PokemonStats({
    required this.attack,
    required this.hp,
    required this.defense,
  });

  static PokemonStats empty() {
    return PokemonStats(hp: '', attack: '', defense: '');
  }

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(
      attack: json['attack'],
      hp: json['hp'],
      defense: json['defense'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'attack': attack,
      'hp': hp,
      'defense': defense,
    };
  }
}

class PokemonType {
  Color backgroundColor;
  PType type;

  PokemonType({required this.backgroundColor, required this.type});

  static PokemonType empty() {
    return PokemonType(backgroundColor: Colors.white, type: PType.unknown);
  }

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonTypeMapper.fromString(json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      'backgroundColor': PokemonTypeMapper.getColorType(backgroundColor),
      'type': PokemonTypeMapper.toStringValue(type)
    };
  }
}

enum PType {
  normal,
  fighting,
  flying,
  poison,
  ground,
  rock,
  bug,
  ghost,
  steel,
  fire,
  water,
  grass,
  electric,
  psychic,
  ice,
  dragon,
  dark,
  fairy,
  unknown,
  shadow,
}

class PokemonTypeMapper {
  static const Map<String, PType> _stringToType = {
    "normal": PType.normal,
    "fighting": PType.fighting,
    "flying": PType.flying,
    "poison": PType.poison,
    "ground": PType.ground,
    "rock": PType.rock,
    "bug": PType.bug,
    "ghost": PType.ghost,
    "steel": PType.steel,
    "fire": PType.fire,
    "water": PType.water,
    "grass": PType.grass,
    "electric": PType.electric,
    "psychic": PType.psychic,
    "ice": PType.ice,
    "dragon": PType.dragon,
    "dark": PType.dark,
    "fairy": PType.fairy,
    "unknown": PType.unknown,
    "shadow": PType.shadow,
  };

  static const Map<PType, Color> _typeToColor = {
    PType.normal: Colors.brown,
    PType.fighting: Color.fromARGB(255, 215, 58, 47),
    PType.flying: Color.fromARGB(255, 46, 110, 163),
    PType.poison: Colors.purple,
    PType.ground: Color.fromARGB(255, 196, 117, 0),
    PType.rock: Color.fromARGB(255, 121, 120, 120),
    PType.bug: Color.fromARGB(255, 67, 163, 71),
    PType.ghost: Colors.indigo,
    PType.steel: Colors.blueGrey,
    PType.fire: Color.fromARGB(255, 212, 103, 2),
    PType.water: Color.fromARGB(255, 30, 132, 216),
    PType.grass: Color.fromARGB(255, 70, 162, 73),
    PType.electric: Color.fromARGB(255, 155, 139, 0),
    PType.psychic: Colors.pink,
    PType.ice: Colors.lightBlue,
    PType.dragon: Colors.deepPurple,
    PType.dark: Colors.black,
    PType.fairy: Color.fromARGB(255, 249, 60, 123),
    PType.unknown: Color.fromARGB(255, 93, 93, 93),
    PType.shadow: Color.fromARGB(221, 39, 39, 39),
  };

  static const Map<PType, String> _typeToString = {
    PType.normal: "normal",
    PType.fighting: "fighting",
    PType.flying: "flying",
    PType.poison: "poison",
    PType.ground: "ground",
    PType.rock: "rock",
    PType.bug: "bug",
    PType.ghost: "ghost",
    PType.steel: "steel",
    PType.fire: "fire",
    PType.water: "water",
    PType.grass: "grass",
    PType.electric: "electric",
    PType.psychic: "psychic",
    PType.ice: "ice",
    PType.dragon: "dragon",
    PType.dark: "dark",
    PType.fairy: "fairy",
    PType.unknown: "unknown",
    PType.shadow: "shadow",
  };

  static String getColorType(Color color) {
    for (var entry in _typeToColor.entries) {
      if (entry.value == color) {
        return _typeToString[entry.key] ?? 'unknown';
      }
    }
    return 'unknown';
  }

  static PokemonType fromString(String value) {
    var ptype = _stringToType[value.toLowerCase()] ?? PType.unknown;

    return PokemonType(
        backgroundColor: _typeToColor[ptype] ?? Colors.amber, type: ptype);
  }

  static String toStringValue(PType type) {
    return _typeToString[type] ?? "unknown";
  }
}
