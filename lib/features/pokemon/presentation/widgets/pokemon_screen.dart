import 'package:flutter/material.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/presentation/base_model.dart';
import 'package:pokemon_flutter/features/core/presentation/widgets/loading.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/model/pokemon_model.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_bar.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/widgets/pokemon_info.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pokemon.type.backgroundColor,
        appBar: PokemonAppBar(pokemon: pokemon),
        body: PokemonInfo(pokemon: pokemon));
  }
}

class PokemonEmptyScreen extends StatelessWidget {
  const PokemonEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: Loading());
  }
}

class InfinitePageView extends StatefulWidget {
  const InfinitePageView({super.key});

  @override
  InfinitePageViewState createState() => InfinitePageViewState();
}

class InfinitePageViewState extends State<InfinitePageView> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonModel>(builder: (context, pokemonModel, _) {
      if (pokemonModel.state == ViewState.busy) {
        return Stack(
          children: [
            if (_pages.isNotEmpty)
              PokemonScreen(
                  pokemon: pokemonModel.pokemons.pokemonList[_currentPage])
            else
              const PokemonEmptyScreen(),
            const Loading()
          ],
        );
      } else {
        if (pokemonModel.pokemons.pokemonList.isNotEmpty) {
          _pages = _buildPagesWithData(pokemonModel.pokemons.pokemonList);
          _pageController = PageController(initialPage: _currentPage);
        }

        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return _pages[_currentPage];
          },
          onPageChanged: (index) {
            if ((pokemonModel.pokemons.pokemonList.length - 1) == index) {
              //fetch data on last element
              pokemonModel.getPokemon();
            }

            setState(() {
              _currentPage = index;
            });
          },
        );
      }
    });
  }

  List<Widget> _buildPagesWithData(List<Pokemon> data) {
    return data
        .map((item) => PokemonScreen(
              pokemon: item,
            ))
        .toList();
  }
}
