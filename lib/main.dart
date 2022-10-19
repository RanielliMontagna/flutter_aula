import 'package:app_aula/containers/contador.dart';
import 'package:app_aula/containers/home.dart';
import 'package:app_aula/containers/sobre.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Primeiro App Flutter';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/sobre': (context) => const SobrePage(),
          '/contador': (context) => const Contador(
                title: "Contador",
              ),
        });
  }
}
