import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/resources/colors.dart';

void main() {
  group('Pokemon', () {
    test('fromJson should correctly parse JSON data', () {
      final jsonData = {
        'id': '001',
        'name': 'Bulbasaur',
        'image': 'https://url.com/image/bulbasaur.png',
        'stats': {
          'attack': '49',
          'hp': '45',
          'defense': '49',
        },
        'type': {
          'type': 'fighting',
        },
      };

      final pokemon = Pokemon.fromJson(jsonData);

      // Verify that the object is created correctly
      expect(pokemon.id, '001');
      expect(pokemon.name, 'Bulbasaur');
      expect(pokemon.image, 'https://url.com/image/bulbasaur.png');
      expect(pokemon.stats.attack, '49');
      expect(pokemon.stats.hp, '45');
      expect(pokemon.stats.defense, '49');
      expect(pokemon.type.backgroundColor, ColorPalette.fightingType);
      expect(pokemon.type.type, PType.fighting);
    });

    test('toJson should correctly convert object to JSON', () {
      final pokemon = Pokemon(
        id: '001',
        name: 'Bulbasaur',
        image: 'https://url.com/image/bulbasaur.png',
        stats: PokemonStats(
          attack: '49',
          hp: '45',
          defense: '49',
        ),
        type: PokemonType(
          backgroundColor: ColorPalette.fightingType,
          type: PType.fighting,
        ),
      );

      final json = pokemon.toJson();

      // Verify that the JSON is created correctly
      expect(json['id'], '001');
      expect(json['name'], 'Bulbasaur');
      expect(json['image'], 'https://url.com/image/bulbasaur.png');
      expect(json['stats']['attack'], '49');
      expect(json['stats']['hp'], '45');
      expect(json['stats']['defense'], '49');
      expect(json['type']['type'], 'fighting');
    });
  });
}
