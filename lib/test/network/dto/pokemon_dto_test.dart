import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/features/core/network/dto/pokemon_dto.dart';

void main() {
  group('PokemonDTO', () {
    test('fromJson should correctly parse JSON data', () {
      final jsonData = {
        'id': 1,
        'name': 'Bulbasaur',
        'sprites': {
          'back_default': 'https://url.com/back_default_sprite',
          'back_female': 'https://url.com/back_female_sprite',
          'back_shiny': 'https://url.com/back_shiny_sprite',
          'back_shiny_female': 'https://url.com/back_shiny_female_sprite',
          'front_default': 'https://url.com/front_default_sprite',
          'front_female': 'https://url.com/front_female_sprite',
          'front_shiny': 'https://url.com/front_shiny_sprite',
          'front_shiny_female': 'https://url.com/front_shiny_female_sprite',
          'other': {
            'home': {'front_default': 'https://url.com/front_default_sprite'}
          }
        },
        'stats': [
          {
            'base_stat': 45,
            'effort': 0,
            'stat': {'name': 'hp', 'url': 'https://url.com/stat_hp'}
          },
        ],
        'types': [
          {
            'slot': 1,
            'type': {'name': 'grass', 'url': 'https://url.com/type_grass'}
          },
        ],
      };

      final pokemonDto = PokemonDTO.fromJson(jsonData);

      // Verify that the object is created correctly
      expect(pokemonDto.id, 1);
      expect(pokemonDto.name, 'Bulbasaur');
      expect(pokemonDto.sprites?.backDefault,
          'https://url.com/back_default_sprite');
      expect(
          pokemonDto.sprites?.backFemale, 'https://url.com/back_female_sprite');
      expect(
          pokemonDto.sprites?.backShiny, 'https://url.com/back_shiny_sprite');
      expect(pokemonDto.sprites?.backShinyFemale,
          'https://url.com/back_shiny_female_sprite');
      expect(pokemonDto.sprites?.frontDefault,
          'https://url.com/front_default_sprite');
      expect(pokemonDto.sprites?.frontFemale,
          'https://url.com/front_female_sprite');
      expect(
          pokemonDto.sprites?.frontShiny, 'https://url.com/front_shiny_sprite');
      expect(pokemonDto.sprites?.frontShinyFemale,
          'https://url.com/front_shiny_female_sprite');
      expect(pokemonDto.sprites?.other?.home?.frontDefault,
          'https://url.com/front_default_sprite');
      expect(pokemonDto.stats?.length, 1);
      expect(pokemonDto.stats?[0].baseStat, 45);
      expect(pokemonDto.stats?[0].effort, 0);
      expect(pokemonDto.stats?[0].stat?.name, 'hp');
      expect(pokemonDto.stats?[0].stat?.url, 'https://url.com/stat_hp');
      expect(pokemonDto.types?.length, 1);
      expect(pokemonDto.types?[0].slot, 1);
      expect(pokemonDto.types?[0].type.name, 'grass');
      expect(pokemonDto.types?[0].type.url, 'https://url.com/type_grass');
    });

    test('toJson should correctly convert object to JSON', () {
      final pokemonDto = PokemonDTO(
        id: 1,
        name: 'Bulbasaur',
        sprites: SpritesEntry(
          backDefault: 'https://url.com/back_default_sprite',
          backFemale: 'https://url.com/back_female_sprite',
          backShiny: 'https://url.com/back_shiny_sprite',
          backShinyFemale: 'https://url.com/back_shiny_female_sprite',
          frontDefault: 'https://url.com/front_default_sprite',
          frontFemale: 'https://url.com/front_female_sprite',
          frontShiny: 'https://url.com/front_shiny_sprite',
          frontShinyFemale: 'https://url.com/front_shiny_female_sprite',
          other: SpritesOtherEntry(
              home: SpriteHomeEntry(
                  frontDefault: 'https://url.com/front_default_sprite')),
        ),
        stats: [
          StatEntry(
            baseStat: 45,
            effort: 0,
            stat: Stat(
              name: 'hp',
              url: 'https://url.com/stat_hp',
            ),
          ),
        ],
        types: [
          TypeEntry(
            slot: 1,
            type: Type(
              name: 'grass',
              url: 'https://url.com/type_grass',
            ),
          ),
        ],
      );

      final json = pokemonDto.toJson();

      // Verify that the JSON is created correctly
      expect(json['id'], 1);
      expect(json['name'], 'Bulbasaur');
      expect(json['sprites']['back_default'],
          'https://url.com/back_default_sprite');
      expect(
          json['sprites']['back_female'], 'https://url.com/back_female_sprite');
      expect(
          json['sprites']['back_shiny'], 'https://url.com/back_shiny_sprite');
      expect(json['sprites']['back_shiny_female'],
          'https://url.com/back_shiny_female_sprite');
      expect(json['sprites']['front_default'],
          'https://url.com/front_default_sprite');
      expect(json['sprites']['front_female'],
          'https://url.com/front_female_sprite');
      expect(
          json['sprites']['front_shiny'], 'https://url.com/front_shiny_sprite');
      expect(json['sprites']['front_shiny_female'],
          'https://url.com/front_shiny_female_sprite');
      expect(json['sprites']['other']['home']['front_default'],
          'https://url.com/front_default_sprite');
      expect(json['stats'].length, 1);
      expect(json['stats'][0]['base_stat'], 45);
      expect(json['stats'][0]['effort'], 0);
      expect(json['stats'][0]['stat']['name'], 'hp');
      expect(json['stats'][0]['stat']['url'], 'https://url.com/stat_hp');
      expect(json['types'].length, 1);
      expect(json['types'][0]['slot'], 1);
      expect(json['types'][0]['type']['name'], 'grass');
      expect(json['types'][0]['type']['url'], 'https://url.com/type_grass');
    });
  });
}
