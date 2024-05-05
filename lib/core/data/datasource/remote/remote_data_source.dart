import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_flutter/core/network/dto/pokemon_list_dto.dart';
import 'package:pokemon_flutter/core/network/dto/pokemon_metadata_dto.dart';
import 'package:pokemon_flutter/core/network/api.dart';
import 'package:pokemon_flutter/core/network/dto/pokemon_dto.dart';
import 'package:pokemon_flutter/core/network/exception.dart';

abstract class RemoteDataSource {
  Future<PokemonDTO> getPokemonInfo(String pokemonId);
  Future<PokemonListDTO> getPokemonList(String offset);
}

class HttpRemoteDataSource implements RemoteDataSource {
  final http.Client client;
  final String paginationLimit = '20';

  HttpRemoteDataSource({required this.client});

  @override
  Future<PokemonDTO> getPokemonInfo(String pokemonId) async {
    final response = await client.get(Uri.parse(Api.getPokemonInfo(pokemonId)));

    if (response.statusCode != 200) {
      throw PokemonInfoRequestFailure();
    }

    final pokemonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    return PokemonDTO.fromJson(pokemonResponse);
  }

  @override
  Future<PokemonListDTO> getPokemonList(String offset) async {
    final response = await client
        .get(Uri.parse(Api.getPokemonMetada(offset, paginationLimit)));

    if (response.statusCode != 200) {
      throw PokemonMetadataRequestFailure();
    }

    final pokemonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final metadada = PokemonMetadataDTO.fromJson(pokemonResponse);

    if (metadada.results != null) {
      var pokemonList = await _getPokemonInfoList(metadada.results!);
      return PokemonListDTO(
          pokemonList: pokemonList,
          nextOffset: extractOffset(metadada.next ?? ''));
    } else {
      return PokemonListDTO(pokemonList: [], nextOffset: null);
    }
  }

  Future<List<PokemonDTO>> _getPokemonInfoList(
      List<PokemonResult> pokemonResult) async {
    List<PokemonDTO> pokemonList = [];
    for (var result in pokemonResult) {
      if (result.url != null) {
        var pokemon = await getPokemonInfo(extractPokemonId(result.url!));
        pokemonList.add(pokemon);
      }
    }
    return pokemonList;
  }

  static String extractPokemonId(String url) {
    // Split the URL by "/". Example URL: "https://pokeapi.co/api/v2/pokemon/4/"
    List<String> parts = url.split("/");

    return parts[parts.length - 2];
  }

  static String? extractOffset(String url) {
    // Find the index of the 'offset=' substring. Example URL: "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20"
    int index = url.indexOf('offset=');
    if (index != -1) {
      int endIndex = url.indexOf('&', index);
      if (endIndex != -1) {
        String offsetString = url.substring(index + 'offset='.length, endIndex);
        return offsetString;
      }
    }

    return null;
  }
}
