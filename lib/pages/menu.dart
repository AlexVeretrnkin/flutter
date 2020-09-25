import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Menu'),
      ),
      body: Row(
        children: [
          Text(
            'Menu!!!',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
