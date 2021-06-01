import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_app_flutter/app/pages/home_page.dart';

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
      home: HomePage(title: 'Flutter Demo Home Page',),
    );
  }
}