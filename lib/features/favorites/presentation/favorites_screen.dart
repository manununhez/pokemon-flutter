import 'package:flutter/material.dart';
import 'package:pokemon_flutter/core/presentation/base_model.dart';
import 'package:pokemon_flutter/core/presentation/widgets/loading.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
import 'package:pokemon_flutter/features/favorites/presentation/widgets/favorite_bar.dart';
import 'package:pokemon_flutter/features/favorites/presentation/widgets/favorite_list.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteModel>(
      builder: (context, model, child) {
        if (model.state == ViewState.busy) {
          return const Loading();
        } else {
          return const Scaffold(
            appBar: FavoriteAppBar(),
            body: FavoritesList(),
          );
        }
      },
    );
  }
}
