import 'package:pokemon_flutter/features/core/domain/pokemon.dart';

abstract class FavoriteRepository {
  Future<List<Pokemon>> getFavorites();
  Future<void> removeFavoritePokemon(Pokemon pokemon);
}
