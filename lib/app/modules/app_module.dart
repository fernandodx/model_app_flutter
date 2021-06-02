import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:model_app_flutter/app/app_widget.dart';
import 'package:model_app_flutter/app/modules/home/home_module.dart';
import 'package:model_app_flutter/app/modules/home/repository/pokemon_repository.dart';

class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [

    Bind((i) => Dio(BaseOptions(baseUrl: PokemonRepository.URL_BASE))),

  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(NamedRoutes.HOME, module: HomeModule())
  ];

}