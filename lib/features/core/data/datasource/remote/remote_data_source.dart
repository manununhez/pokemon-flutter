import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_flutter/features/core/network/api.dart';
import 'package:pokemon_flutter/features/core/network/pokemon_dto.dart';

abstract class PokemonService {
  Future<PokemonDTO> getPokemonInfo(String pokemonId);
}

class HttpRemoteDataSource implements PokemonService {
  @override
  Future<PokemonDTO> getPokemonInfo(String pokemonId) async {
    final response = await http.get(Uri.parse(Api.getPokemonInfo(pokemonId)));
    if (response.statusCode == 200) {
      final pokemonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      return PokemonDTO.fromJson(pokemonResponse);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
