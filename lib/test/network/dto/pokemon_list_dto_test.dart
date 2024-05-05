import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/features/core/network/dto/pokemon_dto.dart';
import 'package:pokemon_flutter/features/core/network/dto/pokemon_list_dto.dart';

void main() {
  group('PokemonListDTO', () {
    test('fromJson should correctly parse JSON data', () {
      final jsonData = {
        'next': 'https://url.com/next_offset',
        'results': [
          {
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
                'home': {
                  'front_default': 'https://url.com/front_default_sprite'
                }
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
          },
        ],
      };

      final pokemonListDto = PokemonListDTO.fromJson(jsonData);

      // Verify that the object is created correctly
      expect(pokemonListDto.nextOffset, 'https://url.com/next_offset');
      expect(pokemonListDto.pokemonList.length, 1);
      expect(pokemonListDto.pokemonList[0].id, 1);
      expect(pokemonListDto.pokemonList[0].name, 'Bulbasaur');
      expect(pokemonListDto.pokemonList[0].sprites?.backDefault,
          'https://url.com/back_default_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.backFemale,
          'https://url.com/back_female_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.backShiny,
          'https://url.com/back_shiny_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.backShinyFemale,
          'https://url.com/back_shiny_female_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.frontDefault,
          'https://url.com/front_default_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.frontFemale,
          'https://url.com/front_female_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.frontShiny,
          'https://url.com/front_shiny_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.frontShinyFemale,
          'https://url.com/front_shiny_female_sprite');
      expect(pokemonListDto.pokemonList[0].sprites?.other?.home?.frontDefault,
          'https://url.com/front_default_sprite');
      expect(pokemonListDto.pokemonList[0].stats?.length, 1);
      expect(pokemonListDto.pokemonList[0].stats?[0].baseStat, 45);
      expect(pokemonListDto.pokemonList[0].stats?[0].effort, 0);
      expect(pokemonListDto.pokemonList[0].stats?[0].stat?.name, 'hp');
      expect(pokemonListDto.pokemonList[0].stats?[0].stat?.url,
          'https://url.com/stat_hp');
      expect(pokemonListDto.pokemonList[0].types?.length, 1);
      expect(pokemonListDto.pokemonList[0].types?[0].slot, 1);
      expect(pokemonListDto.pokemonList[0].types?[0].type.name, 'grass');
      expect(pokemonListDto.pokemonList[0].types?[0].type.url,
          'https://url.com/type_grass');
    });

    test('toJson should correctly convert object to JSON', () {
      final pokemonListDto = PokemonListDTO(
        nextOffset: 'https://url.com/next_offset',
        pokemonList: [
          PokemonDTO(
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
          ),
        ],
      );

      final json = pokemonListDto.toJson();

      // Verify that the JSON is created correctly
      expect(json['next'], 'https://url.com/next_offset');
      expect(json['results'].length, 1);
      expect(json['results'][0]['id'], 1);
      expect(json['results'][0]['name'], 'Bulbasaur');
      expect(json['results'][0]['sprites']['back_default'],
          'https://url.com/back_default_sprite');
      expect(json['results'][0]['sprites']['back_female'],
          'https://url.com/back_female_sprite');
      expect(json['results'][0]['sprites']['back_shiny'],
          'https://url.com/back_shiny_sprite');
      expect(json['results'][0]['sprites']['back_shiny_female'],
          'https://url.com/back_shiny_female_sprite');
      expect(json['results'][0]['sprites']['front_default'],
          'https://url.com/front_default_sprite');
      expect(json['results'][0]['sprites']['front_female'],
          'https://url.com/front_female_sprite');
      expect(json['results'][0]['sprites']['front_shiny'],
          'https://url.com/front_shiny_sprite');
      expect(json['results'][0]['sprites']['front_shiny_female'],
          'https://url.com/front_shiny_female_sprite');
      expect(json['results'][0]['sprites']['other']['home']['front_default'],
          'https://url.com/front_default_sprite');
      expect(json['results'][0]['stats'].length, 1);
      expect(json['results'][0]['stats'][0]['base_stat'], 45);
      expect(json['results'][0]['stats'][0]['effort'], 0);
      expect(json['results'][0]['stats'][0]['stat']['name'], 'hp');
      expect(json['results'][0]['stats'][0]['stat']['url'],
          'https://url.com/stat_hp');
      expect(json['results'][0]['types'].length, 1);
      expect(json['results'][0]['types'][0]['slot'], 1);
      expect(json['results'][0]['types'][0]['type']['name'], 'grass');
      expect(json['results'][0]['types'][0]['type']['url'],
          'https://url.com/type_grass');
    });
  });
}
