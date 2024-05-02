
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';

class AddFavoriteUseCase {
  PokemonRepository repository = locator<PokemonRepository>();

  Future<void> execute(Pokemon pokemon) => repository.saveFavoritePokemon(pokemon);
}