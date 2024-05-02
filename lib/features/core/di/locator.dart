import 'package:get_it/get_it.dart';
import 'package:pokemon_flutter/features/core/data/datasource/local/local_data_source.dart';
import 'package:pokemon_flutter/features/core/data/datasource/remote/remote_data_source.dart';
import 'package:pokemon_flutter/features/core/data/repository/pokemon_repository_impl.dart';
import 'package:pokemon_flutter/features/pokemon/domain/repository/pokemon_repository.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/home_view_model.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<PokemonService>(HttpRemoteDataSource());
  locator.registerSingleton<LocalPokemonDataSource>(
      SharedPreferencesPokemonDataSource());
  locator.registerSingleton<PokemonRepository>(PokemonRepositoryImpl());

  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => GetPokemonUseCase());
}
