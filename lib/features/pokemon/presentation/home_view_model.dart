import 'package:pokemon_flutter/features/core/domain/pokemon.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_flutter/features/pokemon/presentation/base_view_model.dart';
import 'package:pokemon_flutter/features/core/di/locator.dart';

class HomeViewModel extends BaseViewModel {
  GetPokemonUseCase getPokemonUseCase = locator<GetPokemonUseCase>();

  Pokemon pokemon = Pokemon(
      id: "1",
      name: "Test",
      image: "",
      stats: PokemonStats(hp: '', defense: '', attack: ''),
      type: PokemonType.bug);

  Future getPokemon(String pokemonId) async {
    setState(ViewState.BUSY);
    pokemon = await getPokemonUseCase.execute(pokemonId);
    setState(ViewState.IDLE);
  }
}
