import 'dart:convert';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalPokemonDataSource {
  Future<List<Pokemon>> getFavoritePokemons();
  Future<void> saveFavoritePokemon(Pokemon pokemon);
  Future<void> removeFavoritePokemon(String pokemonId);
}

class SharedPreferencesPokemonDataSource implements LocalPokemonDataSource {
  static const _key = 'favorite_pokemons';

  @override
  Future<List<Pokemon>> getFavoritePokemons() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_key) ?? [];

    return favoritesJson
        .map((json) => Pokemon.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<void> saveFavoritePokemon(Pokemon pokemon) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoritePokemons();
    final pokemonIds = favorites.map((pokemon) => pokemon.id).toList();

    if (!pokemonIds.contains(pokemon.id)) {
      favorites.add(pokemon);
      final favoritesJson =
          favorites.map((pokemon) => jsonEncode(pokemon.toJson())).toList();
      prefs.setStringList(_key, favoritesJson);
    }
  }

  @override
  Future<void> removeFavoritePokemon(String pokemonId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoritePokemons();
    favorites.removeWhere((pokemon) => pokemon.id == pokemonId);
    final favoritesJson =
        favorites.map((pokemon) => jsonEncode(pokemon.toJson())).toList();
    prefs.setStringList(_key, favoritesJson);
  }
}
