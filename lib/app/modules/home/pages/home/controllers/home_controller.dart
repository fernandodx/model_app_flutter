import 'package:mobx/mobx.dart';
import 'package:model_app_flutter/app/modules/home/models/pokemon_model.dart';
import 'package:model_app_flutter/app/modules/home/repository/pokemon_repository.dart';
part 'home_controller.g.dart'; //para gerar a classe flutter packages pub run build_runner build


class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  final PokemonRepository pokemonRepository;

  HomeControllerBase(this.pokemonRepository);

  @observable
  int counter = 0;

  @observable
  ObservableFuture<List<PokemonModel>>? pokemons;

  @action
  increment() {
    counter++;
  }

  bool isMoreThanZero() {
    return counter > 0;
  }

  @action
  initPokemons() async {
      pokemons = pokemonRepository.getAllPokemons().asObservable();
  }


}




