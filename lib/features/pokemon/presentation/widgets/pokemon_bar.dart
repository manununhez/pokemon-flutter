import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
import 'package:pokemon_flutter/features/favorites/presentation/favorites_screen.dart';
import 'package:provider/provider.dart';

class PokemonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokemonAppBar({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: pokemon.type.backgroundColor,
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                            create: (context) =>
                                locator<FavoriteModel>()..getFavorites(),
                            child: const FavoritesScreen())));
              },
              child: Row(
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
              ))
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
