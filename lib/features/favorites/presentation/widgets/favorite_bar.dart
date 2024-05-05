import 'package:flutter/material.dart';
import 'package:pokemon_flutter/core/resources/theme_text.dart';

class FavoriteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoriteAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      actions: [
        Container(
          padding: const EdgeInsets.only(right: 40.0),
          child: Text('Mis favoritos',
              style: ThemeText.textAppBarGray),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
