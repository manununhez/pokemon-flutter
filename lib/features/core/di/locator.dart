import 'package:get_it/get_it.dart';
import 'package:pokemon_flutter/features/core/data/datasource/local/local_data_source.dart';
import 'package:pokemon_flutter/features/core/data/datasource/remote/remote_data_source.dart';
import 'package:pokemon_flutter/features/core/data/repository/favorite_repository_impl.dart';
import 'package:pokemon_flutter/features/core/data/repository/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/features/favorites/domain/repository/favorite_repository.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:pokemon_flutter/features/favorites/domain/usecase/remove_favorite_usecase.dart';
import 'package:pokemon_flutter/features/favorites/presentation/model/favorite_model.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/add_favorite_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/is_favorite_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/model/pokemon_model.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<PokemonService>(HttpRemoteDataSource());
  locator.registerSingleton<LocalPokemonDataSource>(
      SharedPreferencesPokemonDataSource());
  locator.registerSingleton<PokemonRepository>(PokemonRepositoryImpl());
  locator.registerSingleton<FavoriteRepository>(FavoriteRepositoryImpl());
  locator.registerFactory(() => PokemonModel());
  locator.registerFactory(() => FavoriteModel());
  locator.registerFactory(() => GetPokemonUseCase());
  locator.registerFactory(() => AddFavoriteUseCase());
  locator.registerFactory(() => GetFavoritesUseCase());
  locator.registerFactory(() => RemoveFavoriteUseCase());
  locator.registerFactory(() => IsFavoriteUseCase());
}
