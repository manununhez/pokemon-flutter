import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/home_screen.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/home_view_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel()..getPokemon("1"),
      child: const MaterialApp(
        home: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   title: const Text("Title"),
          // ),
          body: HomeScreen(),
        ),
      ),
    );
  }
}