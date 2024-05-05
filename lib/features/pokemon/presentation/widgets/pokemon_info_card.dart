import 'package:flutter/material.dart';
import 'package:pokemon_flutter/core/domain/pokemon.dart';
import 'package:pokemon_flutter/core/resources/colors.dart';
import 'package:pokemon_flutter/core/resources/theme_text.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_stats.dart';
import 'package:provider/provider.dart';

class PokemonInfoCard extends StatelessWidget {
  const PokemonInfoCard({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var favoriteModel = context.watch<FavoriteModel>();

    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
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
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: ColorPalette.lightGray)),
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Text(
                          'Type: ${pokemon.type.type.name.capitalize()}',
                          style: ThemeText.textStatsValue),
                    ),
                  )),
                ]),
            const SizedBox(height: 20),
            SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ChoosePokemonButton(
                  pokemon: pokemon,
                  isFavorite: favoriteModel.isFavorite(pokemon),
                  onPressed: () {
                    favoriteModel.updateFavorite(pokemon);
                  },
                ))
          ],
        ));
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
              isFavorite ? pokemon.type.backgroundColor : ColorPalette.darkGray,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )),
      onPressed: onPressed,
      child: Text(isFavorite ? messageIsFavorite : messageIsNotFavorite,
          style: ThemeText.favoriteText),
    );
  }
}
