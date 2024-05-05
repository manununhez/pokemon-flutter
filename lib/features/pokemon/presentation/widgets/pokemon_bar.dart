import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/resources/theme_text.dart';

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
                Navigator.pushNamed(context, '/favorites');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Mis favoritos', style: ThemeText.textAppBarWhite),
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
