import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_app_flutter/components/preview-list.dart';

import 'package:mobile_app_flutter/models/screen-arguments.dart';

import 'selection-screen.dart';

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
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.home,
                color: Colors.deepPurple,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Main screen',
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.search,
                size: 20,
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Icon(
                  FontAwesomeIcons.user,
                  size: 12,
                ),
              ),
            ],
          )
        ],
      )),
      body: Builder(
        builder: (BuildContext context) => SizedBox.expand(
          child: Column(
            children: [
              PreviewList(),
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text('Business')),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_music), title: Text('School')),
      ]),
    );
  }
}
