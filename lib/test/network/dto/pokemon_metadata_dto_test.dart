import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/core/network/dto/pokemon_metadata_dto.dart';

void main() {
  group('PokemonMetadataDTO', () {
    test('fromJson should correctly parse JSON data', () {
      final jsonData = {
        'count': 100,
        'next': 'https://url.com/next_offset',
        'previous': 'https://url.com/previous_offset',
        'results': [
          {
            'name': 'bulbasaur',
            'url': 'https://url.com/pokemon/bulbasaur',
          },
          {
            'name': 'charmander',
            'url': 'https://url.com/pokemon/charmander',
          },
        ],
      };

      final pokemonMetadataDto = PokemonMetadataDTO.fromJson(jsonData);

      // Verify that the object is created correctly
      expect(pokemonMetadataDto.count, 100);
      expect(pokemonMetadataDto.next, 'https://url.com/next_offset');
      expect(pokemonMetadataDto.previous, 'https://url.com/previous_offset');
      expect(pokemonMetadataDto.results!.length, 2);
      expect(pokemonMetadataDto.results![0].name, 'bulbasaur');
      expect(pokemonMetadataDto.results![0].url,
          'https://url.com/pokemon/bulbasaur');
    });

    test('toJson should correctly convert object to JSON', () {
      final pokemonMetadataDto = PokemonMetadataDTO(
        count: 100,
        next: 'https://url.com/next_offset',
        previous: 'https://url.com/previous_offset',
        results: [
          PokemonResult(
            name: 'bulbasaur',
            url: 'https://url.com/pokemon/bulbasaur',
          ),
          PokemonResult(
            name: 'charmander',
            url: 'https://url.com/pokemon/charmander',
          ),
        ],
      );

      final json = pokemonMetadataDto.toJson();

      // Verify that the JSON is created correctly
      expect(json['count'], 100);
      expect(json['next'], 'https://url.com/next_offset');
      expect(json['previous'], 'https://url.com/previous_offset');
      expect(json['results'].length, 2);
      expect(json['results'][0]['name'], 'bulbasaur');
      expect(json['results'][0]['url'], 'https://url.com/pokemon/bulbasaur');
    });
  });
}
