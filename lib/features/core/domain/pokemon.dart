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
      type: PokemonTypeMapper.fromString(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'stats': stats.toJson(),
      'type': PokemonTypeMapper.toStringValue(type),
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

enum PokemonType {
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
  static const Map<String, PokemonType> _stringToEnum = {
    "normal": PokemonType.normal,
    "fighting": PokemonType.fighting,
    "flying": PokemonType.flying,
    "poison": PokemonType.poison,
    "ground": PokemonType.ground,
    "rock": PokemonType.rock,
    "bug": PokemonType.bug,
    "ghost": PokemonType.ghost,
    "steel": PokemonType.steel,
    "fire": PokemonType.fire,
    "water": PokemonType.water,
    "grass": PokemonType.grass,
    "electric": PokemonType.electric,
    "psychic": PokemonType.psychic,
    "ice": PokemonType.ice,
    "dragon": PokemonType.dragon,
    "dark": PokemonType.dark,
    "fairy": PokemonType.fairy,
    "unknown": PokemonType.unknown,
    "shadow": PokemonType.shadow,
  };

  static const Map<PokemonType, String> _enumToString = {
    PokemonType.normal: "normal",
    PokemonType.fighting: "fighting",
    PokemonType.flying: "flying",
    PokemonType.poison: "poison",
    PokemonType.ground: "ground",
    PokemonType.rock: "rock",
    PokemonType.bug: "bug",
    PokemonType.ghost: "ghost",
    PokemonType.steel: "steel",
    PokemonType.fire: "fire",
    PokemonType.water: "water",
    PokemonType.grass: "grass",
    PokemonType.electric: "electric",
    PokemonType.psychic: "psychic",
    PokemonType.ice: "ice",
    PokemonType.dragon: "dragon",
    PokemonType.dark: "dark",
    PokemonType.fairy: "fairy",
    PokemonType.unknown: "unknown",
    PokemonType.shadow: "shadow",
  };

  static PokemonType fromString(String value) {
    return _stringToEnum[value.toLowerCase()] ?? PokemonType.unknown;
  }

  static String toStringValue(PokemonType type) {
    return _enumToString[type] ?? "unknown";
  }
}

extension PokemonTypeExtension on PokemonType {
  Color get color {
    switch (this) {
      case PokemonType.normal:
        return Colors.brown;
      case PokemonType.fighting:
        return Colors.red;
      case PokemonType.flying:
        return Colors.blue;
      case PokemonType.poison:
        return Colors.purple;
      case PokemonType.ground:
        return Colors.orange;
      case PokemonType.rock:
        return Colors.grey;
      case PokemonType.bug:
        return Colors.green;
      case PokemonType.ghost:
        return Colors.indigo;
      case PokemonType.steel:
        return Colors.blueGrey;
      case PokemonType.fire:
        return Colors.orange;
      case PokemonType.water:
        return Colors.blue;
      case PokemonType.grass:
        return Colors.green;
      case PokemonType.electric:
        return Colors.yellow;
      case PokemonType.psychic:
        return Colors.pink;
      case PokemonType.ice:
        return Colors.lightBlue;
      case PokemonType.dragon:
        return Colors.deepPurple;
      case PokemonType.dark:
        return Colors.black;
      case PokemonType.fairy:
        return Colors.pinkAccent;
      case PokemonType.unknown:
        return Colors.grey;
      case PokemonType.shadow:
        return Colors.black87;
      default:
        return Colors.transparent;
    }
  }
}
