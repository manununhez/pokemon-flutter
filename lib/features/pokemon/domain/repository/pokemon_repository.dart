import 'package:pokemon_flutter/features/core/domain/pokemon_list.dart';

abstract class PokemonRepository {
  Future<PokemonList> getPokemonInfo(String offset);
}
