import 'package:pokemon_flutter/features/core/domain/pokemon_list.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class GetPokemonUseCase {
  PokemonRepository repository = locator<PokemonRepository>();

  Future<PokemonList> execute(String offset) {
    return repository.getPokemonInfo(offset);
  }
}
