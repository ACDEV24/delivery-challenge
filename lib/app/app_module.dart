import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:delivery/app/app_widget.dart';
import 'package:delivery/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  
  @override
  List<Bind> get binds => [
    Bind((i) => AppController(
      primaryColor: const Color(0xff472196),
      // secondaryColor: const Color(0xff314E6F),
      secondaryColor: const Color.fromRGBO(21, 62, 115, 1),
    )),
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, module: HomeModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
