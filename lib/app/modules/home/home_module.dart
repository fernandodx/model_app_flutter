import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:model_app_flutter/app/modules/home/pages/home/controllers/home_controller.dart';
import 'package:model_app_flutter/app/modules/home/pages/home/home_page.dart';
import 'package:model_app_flutter/app/modules/home/pages/other/other_page.dart';
import 'package:model_app_flutter/app/modules/home/repository/pokemon_repository.dart';

import '../../app_widget.dart';

class HomeModule extends Module {

  @override
  final List<Bind> binds = [
    //Controllers
    Bind((i) => HomeController(i.get<PokemonRepository>())),

    //Repositorys
    Bind((i) => PokemonRepository(i.get<Dio>())),

  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(NamedRoutes.HOME, child: (context, args) => HomePage(title: 'Flutter Demo Home Page',)),
    ChildRoute(NamedRoutes.OTHER, child: (context, args) => OtherPage(text: args.data,))
  ];


}