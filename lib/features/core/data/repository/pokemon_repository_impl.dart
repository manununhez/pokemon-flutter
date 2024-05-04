import 'package:pokemon_flutter/features/core/data/datasource/local/local_data_source.dart';
import 'package:pokemon_flutter/features/core/data/datasource/remote/remote_data_source.dart';
import 'package:pokemon_flutter/features/core/data/mapper/local_to_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon_list.dart';
import 'package:pokemon_flutter/features/core/network/dto/pokemon_list_dto.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  RemoteDataSource remoteDataSource = locator<RemoteDataSource>();
  LocalDataSource localDataSource = locator<LocalDataSource>();

  final bool enabledCaching = true;

  @override
  Future<PokemonList> getPokemonInfo(String offset) async {
    if (enabledCaching) {
      var cachedResponse = await localDataSource.getResponse(offset);

      if (cachedResponse != null) {
        return PokemonListDTO.fromJson(cachedResponse).toPokemonList();
      }
    }

    final pokemonListDto = await remoteDataSource.getPokemonList(offset);

    if (enabledCaching) {
      localDataSource.saveResponse(pokemonListDto.toJson(), offset);
    }
    return pokemonListDto.toPokemonList();
  }

  @override
  Future<void> saveFavoritePokemon(Pokemon pokemon) async {
    localDataSource.saveFavoritePokemon(pokemon);
  }

  @override
  Future<void> removeFavoritePokemon(Pokemon pokemon) async {
    localDataSource.removeFavoritePokemon(pokemon.id);
  }

  @override
  Future<bool> isFavoritePokemon(String pokemonId) async {
    return localDataSource.isFavoritePokemon(pokemonId);
  }
}
