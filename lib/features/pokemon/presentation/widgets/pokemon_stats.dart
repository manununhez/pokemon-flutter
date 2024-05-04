import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/resources/colors.dart';
import 'package:pokemon_flutter/features/core/resources/theme_text.dart';

class PokemonInfoStats extends StatelessWidget {
  const PokemonInfoStats(
      {super.key,
      required this.statName,
      required this.statValue,
      required this.backgroundColor});

  final String statName;
  final String statValue;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(1, 0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.19,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorPalette.lightGray)),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Text(statValue, style: ThemeText.textStatsValue),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(-1, 0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.19,
            height: 50,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Text(statName, style: ThemeText.favoriteText),
            ),
          ),
        ),
      ],
    );
  }
}
