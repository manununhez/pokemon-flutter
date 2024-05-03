import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/presentation/base_model.dart';
import 'package:pokemon_flutter/features/core/presentation/widgets/loading.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/viewmodel/pokemon_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_bar.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_details.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    var homeViewModel = context.watch<PokemonModel>();

    return Consumer<PokemonModel>(
      builder: (context, model, child) {
        if (model.state == ViewState.busy) {
          return const Loading();
        } else {
          return PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              children: getPages(homeViewModel.pokemons));
        }
      },
    );
  }

  List<Widget> getPages(List<Pokemon> pokemons) {
    List<Widget> pages = [];

    for (var pokemon in pokemons) {
      pages.add(PokemonScreen(
        pokemon: pokemon,
      ));
    }

    return pages;
  }
}

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pokemon.type.backgroundColor,
        appBar: PokemonAppBar(pokemon: pokemon),
        body: PokemonInfo(pokemon: pokemon));
  }
}
