import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark
      ),
      // home: HomePage(title: 'Flutter Demo Home Page',),
      initialRoute: NamedRoutes.HOME,
    ).modular();
  }
}

 abstract class NamedRoutes {

  static String get HOME  => "/";
  static String get OTHER  => "/other";

}