import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_flutter/features/favorites/presentation/favorites_screen.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/home_screen.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/model/pokemon_model.dart';
import 'package:pokemon_flutter/core/di/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  //Only portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PokemonModel>(
          create: (_) => PokemonModel()..getPokemon(),
        ),
        ChangeNotifierProvider<FavoriteModel>(
          create: (_) => FavoriteModel()..getFavorites(),
        ),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/favorites': (context) => const FavoritesScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
