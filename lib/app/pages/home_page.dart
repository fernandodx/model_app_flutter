import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  var controller = GetIt.I.get<HomeController>();

  late ReactionDisposer disposerAutorun;

  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    disposerAutorun = autorun((_) { //Chamado a cada reaload de um observer
      // _keyScaffold.currentState?.showSnackBar(SnackBar(content: Text("Ola muito doido")));
    });
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (context) {
              return Visibility(
                visible: controller.isMoreThanZero(),
                child: Text(
                  '---[ ${controller.counter} ]---',
                  style: Theme.of(context).textTheme.headline4,
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
