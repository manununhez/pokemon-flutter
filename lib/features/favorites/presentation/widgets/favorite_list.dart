import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/resources/colors.dart';
import 'package:pokemon_flutter/features/core/resources/theme_text.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
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
            : Padding(
                padding: const EdgeInsets.only(
                    right: 40.0, left: 40.0, bottom: 20.0),
                child: ListView.separated(
                  itemCount: favoriteViewModel.favorites.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                        height: 12); // Adjust the height as needed
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return FavoritesItem(
                        pokemon: favoriteViewModel.favorites[index]);
                  },
                ),
              ));
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
        Text("No hay favoritos! Ve a atraparlos", style: ThemeText.textAppBarGray),
        const SizedBox(height: 36),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorPalette.darkGray,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              )),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        )
      ],
    );
  }
}
