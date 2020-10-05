import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text('Menu'),
          ),
        ),
        body: SizedBox.expand(child: RadialMenu()),
      ),
    );
  }
}

// The stateful widget + animation controller
class RadialMenu extends StatefulWidget {
  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller);
  }
}

// The Animation
class RadialAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scale;
  final Animation<double> translation;
  final Animation<double> rotation;

  RadialAnimation({Key key, this.controller})
      : scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
        ),
        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(parent: controller, curve: Curves.linear),
        ),
        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.3,
              0.9,
              curve: Curves.decelerate,
            ),
          ),
        ),
        super(key: key);

  build(context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, builder) {
          return Transform.rotate(
            angle: rotation.value,
            alignment: Alignment.center,
            child: Stack(alignment: Alignment.center, children: [
              _buildButton(0, color: Colors.red, icon: FontAwesomeIcons.thumbtack),
              _buildButton(45, color: Colors.green, icon: FontAwesomeIcons.sprayCan),
              _buildButton(90, color: Colors.orange, icon: FontAwesomeIcons.fire),
              _buildButton(135, color: Colors.blue, icon: FontAwesomeIcons.kiwiBird),
              _buildButton(180, color: Colors.black, icon: FontAwesomeIcons.cat),
              _buildButton(225, color: Colors.indigo, icon: FontAwesomeIcons.paw),
              _buildButton(270, color: Colors.pink, icon: FontAwesomeIcons.bong),
              _buildButton(315, color: Colors.yellow, icon: FontAwesomeIcons.bolt),
              Transform.scale(
                scale: scale.value - 1.5,
                // subtract the beginning value to run the opposite animation
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: _close,
                  backgroundColor: Colors.red,
                  child: Icon(FontAwesomeIcons.timesCircle),
                ),
              ),
              Transform.scale(
                scale: scale.value,
                child: FloatingActionButton(
                    heroTag: null,
                    onPressed: _open,
                    child: Icon(FontAwesomeIcons.solidDotCircle)),
              )
            ]),
          );
        });
  }

  _buildButton(double angle, {Color color, IconData icon}) {
    final double rad = radians(angle);

    return Transform(
        transform: Matrix4.identity()
          ..translate(
              (translation.value) * cos(rad), (translation.value) * sin(rad)),
        child: FloatingActionButton(
            heroTag: null,
            backgroundColor: color,
            onPressed: _close,
            elevation: 0,
            child: Icon(icon)
        )
    );
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }
}
