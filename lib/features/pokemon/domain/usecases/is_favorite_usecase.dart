import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class IsFavoriteUseCase {
  PokemonRepository repository = locator<PokemonRepository>();

  Future<bool> execute(String pokemonId) {
    return repository.isFavoritePokemon(pokemonId);
  }
}
