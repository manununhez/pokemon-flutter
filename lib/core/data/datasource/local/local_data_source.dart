import 'dart:convert';
import 'package:pokemon_flutter/core/domain/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<Pokemon>> getFavoritePokemons();
  Future<void> saveFavoritePokemon(Pokemon pokemon);
  Future<void> removeFavoritePokemon(String pokemonId);
  Future<Map<String, dynamic>?> getResponse(String offset);
  Future<void> saveResponse(Map<String, dynamic> json, String key);
}

class SharedPreferencesDataSource implements LocalDataSource {
  static const favoriteKey = 'favorite_pokemons';
  static const responseKey = 'response_pokemons';

  @override
  Future<List<Pokemon>> getFavoritePokemons() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(favoriteKey) ?? [];

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
      prefs.setStringList(favoriteKey, favoritesJson);
    }
  }

  @override
  Future<void> removeFavoritePokemon(String pokemonId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavoritePokemons();
    favorites.removeWhere((pokemon) => pokemon.id == pokemonId);
    final favoritesJson =
        favorites.map((pokemon) => jsonEncode(pokemon.toJson())).toList();
    prefs.setStringList(favoriteKey, favoritesJson);
  }

  @override
  Future<Map<String, dynamic>?> getResponse(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(responseKey + key);

    if (cachedData == null) {
      return null;
    } else {
      return jsonDecode(cachedData);
    }
  }

  @override
  Future<void> saveResponse(Map<String, dynamic> json, String key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(responseKey + key, jsonEncode(json));
  }
}
