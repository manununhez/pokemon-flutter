abstract class UrlBuilder {
  static const String BASE_URL = "https://pokeapi.co/api/v2";

  static String buildUrl({required String endPoint}) => "$BASE_URL$endPoint";
}

class Api {
  static String getPokemonInfo(String pokemonId) =>
      UrlBuilder.buildUrl(endPoint: "/pokemon/$pokemonId/");
}
