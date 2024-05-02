import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/base_view_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = context.watch<HomeViewModel>();

    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        if (model.state == ViewState.BUSY) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
              child: Text(
            'Value: ${homeViewModel.pokemon.toJson()}',
            style: Theme.of(context).textTheme.headlineLarge,
          ));
        }
      },
    );
  }
}
