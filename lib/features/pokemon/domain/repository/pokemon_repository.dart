import 'package:pokemon_flutter/features/core/domain/pokemon.dart';

abstract class PokemonRepository {
  Future<Pokemon> getPokemonInfo(String pokemonId);
  Future<void> saveFavoritePokemon(Pokemon pokemon);
}
