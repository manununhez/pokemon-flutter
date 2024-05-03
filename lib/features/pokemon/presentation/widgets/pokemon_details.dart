import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info_card.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info_header.dart';

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 20.0, left: 40.0, right: 40.0, bottom: 20.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: PokemonInfoHeader(pokemon: pokemon),
          ),
          // Card
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: PokemonInfoCard(pokemon: pokemon)),
          // Image positioned on top of the card
          Positioned.fill(
            top: 30,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                pokemon.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
