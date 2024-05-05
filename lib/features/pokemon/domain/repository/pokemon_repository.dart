import 'package:pokemon_flutter/core/domain/pokemon_list.dart';

abstract class PokemonRepository {
  Future<PokemonList> getPokemonInfo(String offset);
}
