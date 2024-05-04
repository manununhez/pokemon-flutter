import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon_list.dart';

abstract class PokemonRepository {
  Future<PokemonList> getPokemonInfo(String offset);
  Future<void> saveFavoritePokemon(Pokemon pokemon);
  Future<void> removeFavoritePokemon(Pokemon pokemon);
  Future<bool> isFavoritePokemon(String pokemonId);
}
