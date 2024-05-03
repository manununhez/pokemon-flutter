import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/viewmodel/pokemon_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_details.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_stats.dart';
import 'package:provider/provider.dart';

class PokemonInfoCard extends StatelessWidget {
  const PokemonInfoCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var homeViewModel = context.watch<PokemonModel>();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        height: 350,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 60),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: PokemonInfoStats(
                      statName: "Attack",
                      statValue: pokemon.stats.attack,
                      backgroundColor: pokemon.type.backgroundColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: PokemonInfoStats(
                    statName: "Defense",
                    statValue: pokemon.stats.defense,
                    backgroundColor: pokemon.type.backgroundColor,
                  )),
                ]),
            const SizedBox(height: 20),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: PokemonInfoStats(
                    statName: "HP",
                    statValue: pokemon.stats.hp,
                    backgroundColor: pokemon.type.backgroundColor,
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.18,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDFFFD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                          'Type: ${pokemon.type.type.name.capitalize()}',
                          style: GoogleFonts.lato(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              textStyle:
                                  const TextStyle(color: Color(0xFF383838)))),
                    ),
                  )),
                ]),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ChoosePokemonButton(
                  pokemon: pokemon,
                  isFavorite: homeViewModel.isFavoritePokemon,
                  onPressed: () {
                    homeViewModel.updateFavorite(pokemon);
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class ChoosePokemonButton extends StatelessWidget {
  const ChoosePokemonButton(
      {super.key,
      required this.pokemon,
      required this.isFavorite,
      required this.onPressed});

  final bool isFavorite;
  final VoidCallback? onPressed;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var messageIsNotFavorite = 'Yo te elijo!';
    var messageIsFavorite = 'Te dejo libre :)';

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor:
              isFavorite ? pokemon.type.backgroundColor : Color(0xFF383838),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )),
      onPressed: onPressed,
      child: Text(isFavorite ? messageIsFavorite : messageIsNotFavorite),
    );
  }
}
