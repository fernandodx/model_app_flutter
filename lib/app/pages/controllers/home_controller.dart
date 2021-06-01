import 'package:mobx/mobx.dart';
part 'home_controller.g.dart'; //para gerar a classe flutter packages pub run build_runner build


class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {

  @observable
  int counter = 0;

  @action
  increment() {
    counter++;
  }

  @computed
  bool isMoreThanZero() {
    return counter > 0;
  }


}




