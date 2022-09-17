import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando_desafios/app/modules/tinder/tinder_page.dart';

import 'modules/money_control/money_control_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/tinder', child: (context, args) => const TinderPage()),
    ChildRoute('/', child: (context, args) => const MoneyControlPage()),
  ];
}
