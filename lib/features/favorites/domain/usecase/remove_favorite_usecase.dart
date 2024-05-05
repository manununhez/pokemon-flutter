import 'package:pokemon_flutter/core/di/locator.dart';
import 'package:pokemon_flutter/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/domain/repository/favorite_repository.dart';

class RemoveFavoriteUseCase {
  FavoriteRepository repository = locator<FavoriteRepository>();

  Future<void> execute(Pokemon pokemon) =>
      repository.removeFavoritePokemon(pokemon);
}
