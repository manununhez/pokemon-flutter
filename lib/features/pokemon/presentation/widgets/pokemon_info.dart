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
      height: 680,
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
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (content, error, stackTrace) {
                  return const Icon(Icons.error);
                },
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
