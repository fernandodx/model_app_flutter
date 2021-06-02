import 'package:dio/dio.dart';
import 'package:model_app_flutter/app/modules/home/models/pokemon_model.dart';

class PokemonRepository {

  static final String URL_BASE = "https://pokeapi.co/api/v2";

  Dio dio;
  PokemonRepository(this.dio);
  
  
  Future<List<PokemonModel>> getAllPokemons() async {
    var response =  await dio.get("/pokemon");
    List<PokemonModel> list = [];
    var results = response.data['results'] as List;
    for(var json in results){
      PokemonModel model = PokemonModel(json['name']);
      list.add(model);
    }
    return list;
  }
  
}
