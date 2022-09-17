import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando_desafios/app/modules/tinder/tinder_page.dart';

import 'modules/animacao_implicitas/desafio_one_page.dart';
import 'modules/animacao_implicitas/desafio_two_page.dart';
import 'modules/money_control/money_control_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/tinder', child: (context, args) => const TinderPage()),
    ChildRoute('/', child: (context, args) => const MoneyControlPage()),
    ChildRoute('/implicitas/:id', child: (context, args) {
      final id = args.params['id'];
      if (id == '1') {
        return const DesafioOnePage();
      } else if (id == '2') {
        return const DesafioTwoPage();
      }
      return Container();
    }),
    WildcardRoute(child: (context, args) => Container()),
  ];
}
