import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon_list.dart';
import 'package:pokemon_flutter/features/core/resources/colors.dart';

void main() {
  group('PokemonList toJson and fromJson', () {
    test('toJson converts PokemonList object to JSON', () {
      final pokemon1 = Pokemon(
          id: '1',
          name: 'Bulbasaur',
          image: 'image1.png',
          stats: PokemonStats(attack: '1', defense: '2', hp: '3'),
          type: PokemonType(
              backgroundColor: ColorPalette.bugType, type: PType.bug));
      final pokemon2 = Pokemon(
          id: '2',
          name: 'Charmander',
          image: 'image2.png',
          stats: PokemonStats(attack: '4', defense: '5', hp: '6'),
          type: PokemonType(
              backgroundColor: Colors.deepPurple, type: PType.dragon));
      final pokemonList =
          PokemonList(pokemonList: [pokemon1, pokemon2], nextOffset: 'next');

      // Act
      final json = pokemonList.toJson();

      // Assert
      expect(json['pokemonList'], isList);
      expect(json['pokemonList'].length, 2);
      expect(json['pokemonList'][0]['id'], '1');
      expect(json['pokemonList'][0]['name'], 'Bulbasaur');
      expect(json['pokemonList'][0]['image'], 'image1.png');
      expect(json['pokemonList'][1]['id'], '2');
      expect(json['pokemonList'][1]['name'], 'Charmander');
      expect(json['pokemonList'][1]['image'], 'image2.png');
      expect(json['nextOffset'], 'next');
    });

    test('fromJson converts JSON to PokemonList object', () {
      final json = {
        'pokemonList': [
          {
            'id': '1',
            'name': 'Bulbasaur',
            'image': 'image1.png',
            'stats': {'attack': '1', 'defense': '2', 'hp': '3'},
            'type': {'type': 'bug'}
          },
          {
            'id': '2',
            'name': 'Charmander',
            'image': 'image2.png',
            'stats': {'attack': '4', 'defense': '5', 'hp': '6'},
            'type': {'type': 'dragon'}
          }
        ],
        'nextOffset': 'next'
      };

      // Act
      final pokemonList = PokemonList.fromJson(json);

      // Assert
      expect(pokemonList.pokemonList, isList);
      expect(pokemonList.pokemonList.length, 2);
      expect(pokemonList.pokemonList[0].id, '1');
      expect(pokemonList.pokemonList[0].name, 'Bulbasaur');
      expect(pokemonList.pokemonList[0].image, 'image1.png');
      expect(pokemonList.pokemonList[1].id, '2');
      expect(pokemonList.pokemonList[1].name, 'Charmander');
      expect(pokemonList.pokemonList[1].image, 'image2.png');
      expect(pokemonList.nextOffset, 'next');
    });
  });
}
