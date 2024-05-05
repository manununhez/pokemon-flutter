import 'package:pokemon_flutter/core/domain/pokemon.dart';

class PokemonList {
  List<Pokemon> pokemonList;
  String? nextOffset;

  PokemonList({required this.pokemonList, required this.nextOffset});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList(
        pokemonList: List<Pokemon>.from(
            json['pokemonList'].map((x) => Pokemon.fromJson(x))),
        nextOffset: json['nextOffset']);
  }

  Map<String, dynamic> toJson() {
    return {
      'pokemonList':
          pokemonList.map((pokemonDTO) => pokemonDTO.toJson()).toList(),
      'nextOffset': nextOffset
    };
  }

  static PokemonList empty() {
    return PokemonList(pokemonList: [], nextOffset: '0');
  }
}
