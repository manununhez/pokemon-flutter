import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/network/pokemon_dto.dart';

extension PokemonDTOExtension on PokemonDTO {
  Pokemon toPokemon() {
    return Pokemon(
      id: id.toString(),
      name: name ?? '',
      image: sprites?.other?.home?.frontDefault ?? '',
      stats: _getStats(),
      type: _getType(),
    );
  }

  PokemonStats _getStats() {
    final attackStatEntry =
        stats?.firstWhere((stat) => stat.stat?.name == 'attack');

    final hpStatEntry = stats?.firstWhere((stat) => stat.stat?.name == 'hp');

    final defenseStatEntry =
        stats?.firstWhere((stat) => stat.stat?.name == 'defense');

    return PokemonStats(
      attack: attackStatEntry?.baseStat.toString() ?? '',
      hp: hpStatEntry?.baseStat.toString() ?? '',
      defense: defenseStatEntry?.baseStat.toString() ?? '',
    );
  }

  PokemonType _getType() {
    // Considering only the first type of pokemon if there is more than one
    return types != null && types!.isNotEmpty
        ? _mapType(types![0].type.name)
        : PokemonType.empty();
  }

  PokemonType _mapType(String? typeName) {
    return PokemonTypeMapper.fromString(typeName ?? '');
  }
}
