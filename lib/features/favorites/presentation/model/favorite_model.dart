import 'package:pokemon_flutter/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/add_favorite_usecase.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/remove_favorite_usecase.dart';
import 'package:pokemon_flutter/core/presentation/base_model.dart';
import 'package:pokemon_flutter/core/di/locator.dart';

class FavoriteModel extends BaseModel {
  GetFavoritesUseCase getFavoriteUseCase = locator<GetFavoritesUseCase>();
  RemoveFavoriteUseCase removeFavoriteUseCase =
      locator<RemoveFavoriteUseCase>();
  AddFavoriteUseCase addFavoriteUseCase = locator<AddFavoriteUseCase>();

  List<Pokemon> favorites = [];

  Future removeFromFavorite(Pokemon pokemon) async {
    setState(ViewState.busy);
    await removeFavoriteUseCase.execute(pokemon);
    getFavorites();
    setState(ViewState.idle);
  }

  Future getFavorites() async {
    setState(ViewState.busy);
    favorites = await getFavoriteUseCase.execute();
    setState(ViewState.idle);
  }

  Future updateFavorite(Pokemon pokemon) async {
    setState(ViewState.busy);
    if (isFavorite(pokemon)) {
      await removeFavoriteUseCase.execute(pokemon);
    } else {
      await addFavoriteUseCase.execute(pokemon);
    }
    getFavorites();
    setState(ViewState.idle);
  }

  bool isFavorite(Pokemon pokemon) =>
      favorites.any((favPokemon) => favPokemon.id == pokemon.id);
}
