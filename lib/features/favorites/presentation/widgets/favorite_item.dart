import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info.dart';
import 'package:provider/provider.dart';

class FavoritesItem extends StatelessWidget {
  const FavoritesItem({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final favoriteViewModel = context.watch<FavoriteModel>();

    return Container(
        height: 85,
        padding: const EdgeInsets.only(right: 15.0, left: 15.0),
        decoration: BoxDecoration(
          color: pokemon.type.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Row(
          children: [
            Container(
                height: 85,
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Image.network(pokemon.image, width: 76, height: 76)),
            Expanded(
              child: Text(pokemon.name.capitalize(),
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      textStyle: const TextStyle(color: Colors.white))),
            ),
            IconButton(
                onPressed: () {
                  favoriteViewModel.removeFromFavorite(pokemon);
                },
                icon: Image.asset('assets/icons/delete_icon.png',
                    width: 24, height: 24))
          ],
        )));
  }
}
