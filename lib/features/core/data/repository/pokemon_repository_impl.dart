import 'package:pokemon_flutter/features/core/data/datasource/remote/remote_data_source.dart';
import 'package:pokemon_flutter/features/core/data/mapper/local_to_model.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonService remoteDataSource = locator<PokemonService>();

  @override
  Future<Pokemon> getPokemonInfo(String pokemonId) async {
    final pokemonDto = await remoteDataSource.getPokemonInfo(pokemonId);

    return pokemonDto.toPokemon();
  }
}
