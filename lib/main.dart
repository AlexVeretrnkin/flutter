import 'package:flutter/material.dart';

import 'models/screen-arguments.dart';

import 'pages/main.dart';
import 'pages/menu.dart';
import 'pages/selection-screen.dart';

void main() {
  // runApp(MyApp()); - sample app (first created)

  runApp(HeroApp());
}

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      brightness: Brightness.dark,
    ), initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/second': (context) => DetailScreen(),
      '/third': (context) => SelectionScreen(),
      '/menu': (context) => Menu()
    });
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}
