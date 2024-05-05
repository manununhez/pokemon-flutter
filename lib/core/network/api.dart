abstract class UrlBuilder {
  static const String baseURL = "https://pokeapi.co/api/v2";

  static String buildUrl({required String endPoint}) => "$baseURL$endPoint";
}

class Api {
  static String getPokemonInfo(String pokemonId) =>
      UrlBuilder.buildUrl(endPoint: "/pokemon/$pokemonId/");

  static String getPokemonMetada(String offset, String limit) =>
      UrlBuilder.buildUrl(endPoint: "/pokemon?offset=$offset&limit=$limit");
}
