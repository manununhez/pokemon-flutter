import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_details.dart';

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
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textStyle: const TextStyle(color: Colors.white)),
        ),
        Text(
          pokemon.name.capitalize(),
          style: GoogleFonts.lato(
              fontSize: 27,
              fontWeight: FontWeight.w900,
              textStyle: const TextStyle(color: Colors.white)),
        )
      ],
    );
  }
}
