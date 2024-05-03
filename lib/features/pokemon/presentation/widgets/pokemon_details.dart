import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/viewmodel/home_view_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info_card.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info_header.dart';

//Create THEMES Important!

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({
    super.key,
    required this.homeViewModel,
    required this.pokemon,
  });

  final HomeViewModel homeViewModel;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pokemon.type.backgroundColor,
        appBar: AppBar(
            backgroundColor: pokemon.type.backgroundColor,
            actions: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Mis favoritos',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textStyle: const TextStyle(color: Colors.white))),
                  const SizedBox(width: 16),
                  Image.asset('assets/icons/favorite_icon.png',
                      width: 24, height: 24),
                  const SizedBox(width: 16)
                ],
              )
            ]),
        body: PokemonInfo(homeViewModel: homeViewModel, pokemon: pokemon));
  }
}

class PokemonInfo extends StatelessWidget {
  const PokemonInfo(
      {super.key, required this.pokemon, required this.homeViewModel});

  final HomeViewModel homeViewModel;
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
              child: PokemonInfoCard(
                  homeViewModel: homeViewModel, pokemon: pokemon)),
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
