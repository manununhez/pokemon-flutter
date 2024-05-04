import 'package:pokemon_flutter/features/core/network/dto/pokemon_dto.dart';

class PokemonListDTO {
  String? nextOffset;
  List<PokemonDTO> pokemonList;

  PokemonListDTO({required this.nextOffset, required this.pokemonList});

  factory PokemonListDTO.fromJson(Map<String, dynamic> json) {
    return PokemonListDTO(
        nextOffset: json['nextOffset'],
        pokemonList: List<PokemonDTO>.from(
            json['name'].map((x) => PokemonDTO.fromJson(x))));
  }
}
