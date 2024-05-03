import 'package:pokemon_flutter/features/core/domain/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> getPokemonInfo(String pokemonId);
  Future<void> saveFavoritePokemon(Pokemon pokemon);
  Future<void> removeFavoritePokemon(Pokemon pokemon);
  Future<bool> isFavoritePokemon(String pokemonId);
}
