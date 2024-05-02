import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/add_favorite_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_flutter/features/core/presentation/base_view_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class HomeViewModel extends BaseViewModel {
  GetPokemonUseCase getPokemonUseCase = locator<GetPokemonUseCase>();
  AddFavoriteUseCase addFavoriteUseCase = locator<AddFavoriteUseCase>();

  Pokemon pokemon = Pokemon(
      id: "1",
      name: "Test",
      image: "",
      stats: PokemonStats(hp: '', defense: '', attack: ''),
      type: PokemonType.bug);

  List<Pokemon> favorites = [];

  Future getPokemon(String pokemonId) async {
    setState(ViewState.busy);
    pokemon = await getPokemonUseCase.execute(pokemonId);
    setState(ViewState.idle);
  }

  Future saveToFavorite(Pokemon pokemon) async {
    setState(ViewState.busy);
    await addFavoriteUseCase.execute(pokemon);
    setState(ViewState.idle);
  }
}
