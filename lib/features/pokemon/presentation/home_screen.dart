import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/presentation/base_view_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = context.watch<HomeViewModel>();

    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        if (model.state == ViewState.busy) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                ChoosePokemonButton(
                  title: 'Yo te elijo!',
                  onPressed: () {
                    homeViewModel.saveToFavorite(homeViewModel.pokemon);
                    // homeViewModel.getFavorites();
                  },
                ),
                Text(
                  'Service: ${homeViewModel.pokemon.toJson()}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Favorites: ${homeViewModel.favorites.map((e) => e.toJson())}',
                  style: Theme.of(context).textTheme.headlineLarge,
                )
              ])));
        }
      },
    );
  }
}

class ChoosePokemonButton extends StatelessWidget {
  const ChoosePokemonButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
