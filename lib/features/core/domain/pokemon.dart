import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/resources/colors.dart';

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
    return {'type': PokemonTypeMapper.toStringValue(type)};
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
    PType.fighting: ColorPalette.fightingType,
    PType.flying: ColorPalette.flyingType,
    PType.poison: Colors.purple,
    PType.ground: ColorPalette.groundType,
    PType.rock: ColorPalette.rockType,
    PType.bug: ColorPalette.bugType,
    PType.ghost: Colors.indigo,
    PType.steel: Colors.blueGrey,
    PType.fire: ColorPalette.fireType,
    PType.water: ColorPalette.waterType,
    PType.grass: ColorPalette.grassType,
    PType.electric: ColorPalette.electricType,
    PType.psychic: Colors.pink,
    PType.ice: Colors.lightBlue,
    PType.dragon: Colors.deepPurple,
    PType.dark: Colors.black,
    PType.fairy: ColorPalette.fairyType,
    PType.unknown: ColorPalette.unknownType,
    PType.shadow: ColorPalette.shadowType,
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
