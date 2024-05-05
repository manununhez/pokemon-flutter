//  Exception thrown when pokemon info fails /pokemon/{pokemonId}.
class PokemonInfoRequestFailure implements Exception {}

//  Exception thrown when pokemon info fails /pokemon/offset=&limit=.
class PokemonMetadataRequestFailure implements Exception {}