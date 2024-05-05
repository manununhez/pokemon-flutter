import 'package:pokemon_flutter/core/di/locator.dart';
import 'package:pokemon_flutter/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/domain/repository/favorite_repository.dart';

class GetFavoritesUseCase {
  FavoriteRepository repository = locator<FavoriteRepository>();

  Future<List<Pokemon>> execute() {
    return repository.getFavorites();
  }
}