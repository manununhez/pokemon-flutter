import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/presentation/base_view_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/viewmodel/home_view_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_details.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    var homeViewModel = context.watch<HomeViewModel>();

    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        if (model.state == ViewState.busy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              children: getPages(homeViewModel));
        }
      },
    );
  }

  List<Widget> getPages(HomeViewModel homeViewModel) {
    List<Widget> pages = [];

    for (var pokemon in homeViewModel.pokemons) {
      pages.add(PokemonScreen(
        homeViewModel: homeViewModel,
        pokemon: pokemon,
      ));
    }

    return pages;
  }
}
