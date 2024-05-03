import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/favorites/presentation/favorite_model.dart';
import 'package:pokemon_flutter/features/favorites/presentation/widgets/favorite_item.dart';
import 'package:provider/provider.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = context.watch<FavoriteModel>();

    return Center(
      child: favoriteViewModel.favorites.isEmpty
          ? const FavoritesEmptyList()
          : ListView(
              padding: const EdgeInsets.only(
                  right: 40.0, left: 40.0, bottom: 20.0, top: 40.0),
              children: <Widget>[
                  for (var pokemon in favoriteViewModel.favorites)
                    FavoritesItem(pokemon: pokemon)
                ]),
    );
  }
}

class FavoritesEmptyList extends StatelessWidget {
  const FavoritesEmptyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        Image.asset('assets/images/empty_favorites.png', height: 250),
        const SizedBox(height: 16),
        const Text("No hay favoritos! Ve a atraparlos"),
        const SizedBox(height: 36),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF383838),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              )),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        )
      ],
    );
  }
}
