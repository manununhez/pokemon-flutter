import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class GetPokemonUseCase {
  PokemonRepository repository = locator<PokemonRepository>();

  Future<Pokemon> execute(String pokemonId) {
    return repository.getPokemonInfo(pokemonId);
  }
}