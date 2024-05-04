import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/core/domain/pokemon_list.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/remove_favorite_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/add_favorite_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_flutter/features/core/presentation/base_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/is_favorite_usecase.dart';

class PokemonModel extends BaseModel {
  GetPokemonUseCase getPokemonUseCase = locator<GetPokemonUseCase>();
  AddFavoriteUseCase addFavoriteUseCase = locator<AddFavoriteUseCase>();
  IsFavoriteUseCase isFavoriteUseCase = locator<IsFavoriteUseCase>();
  RemoveFavoriteUseCase removeFavoriteUseCase =
      locator<RemoveFavoriteUseCase>();

  PokemonList pokemons = PokemonList.empty();
  bool isFavoritePokemon = false;

  Future getPokemon() async {
    setState(ViewState.busy);
    if (pokemons.nextOffset != null) {
      var newPokemonList =
          await getPokemonUseCase.execute(pokemons.nextOffset!);
      pokemons = PokemonList(
          pokemonList: pokemons.pokemonList + newPokemonList.pokemonList,
          nextOffset: newPokemonList.nextOffset);
    }
    setState(ViewState.idle);
  }

  Future updateFavorite(Pokemon pokemon) async {
    setState(ViewState.busy);
    if (isFavoritePokemon) {
      await removeFavoriteUseCase.execute(pokemon);
    } else {
      await addFavoriteUseCase.execute(pokemon);
    }
    isFavorite(pokemon.id);
    setState(ViewState.idle);
  }

  Future isFavorite(String pokemonId) async {
    setState(ViewState.busy);
    isFavoritePokemon = await isFavoriteUseCase.execute(pokemonId);
    setState(ViewState.idle);
  }
}
