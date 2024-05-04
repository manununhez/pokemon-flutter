import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/remove_favorite_usecase.dart';
import 'package:pokemon_flutter/features/core/presentation/base_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class FavoriteModel extends BaseModel {
  GetFavoritesUseCase getFavoriteUseCase = locator<GetFavoritesUseCase>();
  RemoveFavoriteUseCase removeFavoriteUseCase =
      locator<RemoveFavoriteUseCase>();

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
}
