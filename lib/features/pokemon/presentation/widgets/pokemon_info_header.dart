import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/resources/theme_text.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info.dart';

class PokemonInfoHeader extends StatelessWidget {
  const PokemonInfoHeader({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pokemon Nro ${pokemon.id}",
          style: ThemeText.textAppBarWhite,
        ),
        Text(
          pokemon.name.capitalize(),
          style: ThemeText.headerTitle,
        )
      ],
    );
  }
}
