import 'package:pokemon_flutter/features/core/data/datasource/local/local_data_source.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/domain/repository/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  LocalPokemonDataSource localDataSource = locator<LocalPokemonDataSource>();

  @override
  Future<List<Pokemon>> getFavorites() {
    return localDataSource.getFavoritePokemons();
  }

  @override
  Future<void> removeFavoritePokemon(Pokemon pokemon) async {
    localDataSource.removeFavoritePokemon(pokemon.id);
  }
}
