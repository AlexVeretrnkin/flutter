import 'package:flutter/material.dart';

class PreviewListItem extends StatelessWidget {
  final int height;
  final int width;

  PreviewListItem({int height = 50, int width = 50}):
    this.height = height,
    this.width = width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.amber[600],
        borderRadius: const BorderRadius.all(const Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)
          )
        ]
      ),
      height: this.height.toDouble(),
      width: this.width.toDouble(),
      child: Center(child: Text('Entry A')),
    );
  }
}