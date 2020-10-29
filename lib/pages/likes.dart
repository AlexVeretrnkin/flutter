import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/components/library-item.dart';
import 'package:mobile_app_flutter/enum/option.dart';
import 'package:mobile_app_flutter/providers/preview-item-provider.dart';
import 'package:provider/provider.dart';

class LikesScreen extends StatelessWidget {
  final Option actionType;

  LikesScreen(Option actionType) : this.actionType = actionType;

  List<Widget> _getItems(PreviewItemProvider provider) {
    switch(actionType) {
      case Option.like:
        return provider.likedItems.map((item) => LibraryItem(item, actionType: actionType)).toList();
      case Option.dislike:
        return provider.dislikedItems.map((item) => LibraryItem(item, actionType: actionType)).toList();
      case Option.addToPlaylist:
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreviewItemProvider>(
      builder: (context, value, child) {
        return ListView(
            children:_getItems(value)
        );
      },
    );
  }
}