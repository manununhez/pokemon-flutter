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
    return Consumer<PokemonModel>(
      builder: (context, model, _) {
        if (model.state == ViewState.busy) {
          return Stack(
            children: [
              PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return _pages.isNotEmpty
                        ? _pages[_currentPage]
                        : const PokemonEmptyScreen();
                  }),
              const Loading()
            ],
          );
        }

        if (model.pokemons.pokemonList.isNotEmpty) {
          _pages = _buildPagesWithData(model.pokemons.pokemonList);
          _pageController = PageController(initialPage: _currentPage);
        }

        model.isFavorite(model.pokemons.pokemonList[_currentPage].id);

        return PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            int pageIndex = index % _pages.length;
            return _pages[pageIndex];
          },
          onPageChanged: (index) {
            if ((model.pokemons.pokemonList.length - 1) == index) {
              model.getPokemon();
            }
            model.isFavorite(model.pokemons.pokemonList[index].id);
            setState(() {
              _currentPage = index;
            });
          },
        );
      },
    );
  }

  List<Widget> _buildPagesWithData(List<Pokemon> data) {
    return data
        .map((item) => PokemonScreen(
              pokemon: item,
            ))
        .toList();
  }
}
