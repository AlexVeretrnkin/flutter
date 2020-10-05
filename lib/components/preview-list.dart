import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/components/preview-list-item.dart';

class PreviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(16),
        children: <Widget>[
          PreviewListItem(height: 100, width: 100),
          PreviewListItem(height: 100, width: 100),
          PreviewListItem(height: 100, width: 200),
        ],
      )
    );
  }
}