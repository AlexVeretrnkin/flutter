import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/enum/option.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';
import 'package:mobile_app_flutter/providers/preview-item-provider.dart';
import 'package:provider/provider.dart';

class LibraryItem extends StatelessWidget {
  final PreviewItem previewItem;
  final Option actionType;

  LibraryItem(PreviewItem previewItem, {actionType: Option})
      : this.previewItem = previewItem ?? PreviewItem.origin(),
        this.actionType = actionType ?? Option.like;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreviewItemProvider>(
      builder: (context, value, child) {
        return ListTile(
          leading: Image.network(previewItem.imageUrl, width: 100, height: 50),
          title: Text(previewItem.name),
          subtitle: Text(previewItem.performer),
          trailing: MaterialButton(
              child: Icon(Icons.delete),
              onPressed: () {
                switch (actionType) {
                  case Option.like:
                    value.removeLike(previewItem);
                    break;
                  case Option.dislike:
                    value.removeDislike(previewItem);
                    break;
                }
              }),
        );
      },
    );
  }
}
