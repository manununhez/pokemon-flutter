import 'package:pokemon_flutter/features/core/network/dto/pokemon_dto.dart';

class PokemonListDTO {
  String? nextOffset;
  List<PokemonDTO> pokemonList;

  PokemonListDTO({required this.nextOffset, required this.pokemonList});

factory PokemonListDTO.fromJson(Map<String, dynamic> json) {
    return PokemonListDTO(
      nextOffset: json['next'] as String?,
      pokemonList: (json['results'] as List<dynamic>).map((e) => PokemonDTO.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'next': nextOffset,
      'results': pokemonList.map((pokemonDTO) => pokemonDTO.toJson()).toList(),
    };
  }
}
