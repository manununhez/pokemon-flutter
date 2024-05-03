import 'package:pokemon_flutter/features/core/data/datasource/local/local_data_source.dart';
import 'package:pokemon_flutter/features/core/data/datasource/remote/remote_data_source.dart';
import 'package:pokemon_flutter/features/core/data/mapper/local_to_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonService remoteDataSource = locator<PokemonService>();
  LocalPokemonDataSource localDataSource = locator<LocalPokemonDataSource>();

  @override
  Future<Pokemon> getPokemonInfo(String pokemonId) async {
    final pokemonDto = await remoteDataSource.getPokemonInfo(pokemonId);

    return pokemonDto.toPokemon();
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
