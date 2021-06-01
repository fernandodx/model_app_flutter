import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:model_app_flutter/app/app_widget.dart';
import 'package:model_app_flutter/app/pages/controllers/home_controller.dart';

void main() {

  GetIt getIt = GetIt.I;
  getIt.registerSingleton<HomeController>(HomeController());

  runApp(AppWidget());
}
