import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/figures/Point.dart';
import 'package:mobile_app_flutter/figures/Rectangle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Map<String, String> gifts = Map();

  var figures = <Rectangle>[];

  void _incrementCounter() {
    _createPoint();

    setState(() {
      _counter++;
    });
  }

  void _createPoint() {
    gifts['first'] = 'First Gift';

    print(gifts['first']);
  
    Point pOrigin = Point.origin();
    Point p = Point(0, 0);

    pOrigin.printPoint();
    p.printPoint();

    print(p == pOrigin);
  }

  void _createListOfFigures() {
    figures.add(Rectangle.origin());
  }

  void _showList() {
    print('List lenght: ${figures.length}');

    figures.forEach((element) => print(element.toString()));
  }

  void _addItemToList() => figures.add(Rectangle(5, 5));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              onPressed: _addItemToList,
              color: Colors.blue,
              child: Text('Add item to list'),
            ),
            FlatButton(
              onPressed: _createListOfFigures,
              color: Colors.blue,
              child: Text('Create list'),
            ),
            FlatButton(
              onPressed: _showList,
              color: Colors.blue,
              child: Text('Show list in terminal'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
