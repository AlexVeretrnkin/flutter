import 'package:flutter/material.dart';

import 'pages/menu.dart';

void main() {
  // runApp(MyApp()); - sample app (first created)

  runApp(HeroApp());
}

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
      '/second': (context) => DetailScreen(),
      '/third': (context) => SelectionScreen(),
      '/menu': (context) => Menu()
    });
  }
}

class MainScreen extends StatelessWidget {
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main Screen'),
        ),
        body: Builder(
          builder: (BuildContext context) => Column(
            children: [
              FlatButton(
                onPressed: () => _navigateAndDisplaySelection(context),
                child: Text('_navigateAndDisplaySelection'),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                ),
                child: Image.network(
                  'https://picsum.photos/250?image=9',
                ),
              ),
              MaterialButton(
                child: Text('Menu'),
                onPressed: () => Navigator.pushNamed(context, '/menu'),
              ),
            ],
          ),
        ));
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

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  // Close the screen and return "Nope!" as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
