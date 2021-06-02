import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:model_app_flutter/app/app_widget.dart';
import 'package:model_app_flutter/app/modules/home/models/pokemon_model.dart';
import 'package:model_app_flutter/app/modules/home/pages/home/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  var controller = Modular.get<HomeController>();

  late ReactionDisposer disposerAutorun;

  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    disposerAutorun = autorun((_) {
      //Chamado a cada reaload de um observer
      _keyScaffold.currentState?.showSnackBar(SnackBar(content: Text("Ola muito doido")));
    });

    controller.initPokemons();
  }

  @override
  void dispose() {
    super.dispose();
    disposerAutorun.reaction.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Observer(builder: (context) {

          if (controller.pokemons?.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.pokemons?.error != null) {
            return Center(
              child: Text("erro!!!!!"),
            );
          }

          List<PokemonModel> list = controller.pokemons!.value!;

          return ListView.builder(
            itemBuilder: (context, index) {
              String name = list[index].name;

              return ListTile(
                title: Text(name),
              );
            },
            itemCount: controller.pokemons!.value!.length,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
          // Modular.to.navigate(NamedRoutes.OTHER);
          // Modular.to.pushNamed(NamedRoutes.OTHER+"/${controller.counter}");
          Modular.to.navigate(NamedRoutes.OTHER, arguments: "Olá Mundo");
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
