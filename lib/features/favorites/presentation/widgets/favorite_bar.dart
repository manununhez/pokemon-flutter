import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  textStyle: const TextStyle(color: Color(0xFF383838)))),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
