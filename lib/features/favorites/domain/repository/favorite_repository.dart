import 'package:pokemon_flutter/core/domain/pokemon.dart';

abstract class FavoriteRepository {
  Future<List<Pokemon>> getFavorites();
  Future<void> removeFavoritePokemon(Pokemon pokemon);
  Future<void> saveFavoritePokemon(Pokemon pokemon);
}
