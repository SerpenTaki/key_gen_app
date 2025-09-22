import 'package:key_gen_app/screens/PrimaPagina.dart';
import 'package:key_gen_app/screens/SecondaPagina.dart';
import 'package:key_gen_app/screens/_terza_pagina.dart';
import 'package:key_gen_app/screens/_quarta_pagina.dart';
import 'package:key_gen_app/screens/_quinta_pagina.dart';
import 'package:key_gen_app/screens/Carta.dart';
import 'package:key_gen_app/screens/Sliddare.dart';
import 'package:key_gen_app/screens/_tabs.dart';
import 'package:key_gen_app/screens/MaterialDUI.dart';
import 'package:key_gen_app/HttpTutorialScreens/Pagina1.dart';
import 'package:flutter/material.dart';

//Per mandare dati dinamici
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/PrimaPagina':
        return MaterialPageRoute(builder: (context) => Primapagina());
      case '/SecondaPagina':
        if (args is String) {
          return MaterialPageRoute(
            builder: (context) => Secondapagina(data: args),
          );
        }
        return _errorRoute();
      case '/TerzaPagina':
        return MaterialPageRoute(builder: (context) => TerzaPagina());
      case '/QuartaPagina':
        return MaterialPageRoute(builder: (context) => QuartaPagina());
      case '/QuintaPagina':
        return MaterialPageRoute(builder: (context) => QuintaPagina());
      case '/Card':
        return MaterialPageRoute(builder: (context) => Carta());
      case '/Slievers':
        return MaterialPageRoute(builder: (context) => Sliddare());
      case '/Tabs':
        return MaterialPageRoute(builder: (context) => Tabbare());
      case '/MaterialDUI':
        return MaterialPageRoute(builder: (context) => Materialdui());
      case '/Pagina1':
        return MaterialPageRoute(builder: (context) => Pagina1());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Center(child: Text('Error'))),
    );
  }
}
