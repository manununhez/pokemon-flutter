import 'package:pokemon_flutter/core/domain/pokemon_list.dart';
import 'package:pokemon_flutter/features/pokemon/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_flutter/core/presentation/base_model.dart';
import 'package:pokemon_flutter/core/di/locator.dart';

class PokemonModel extends BaseModel {
  GetPokemonUseCase getPokemonUseCase = locator<GetPokemonUseCase>();

  PokemonList pokemons = PokemonList.empty();

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
}
