import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';

class PreviewListItem extends StatelessWidget {
  final int height;
  final int width;
  final PreviewItem previewItem;

  PreviewListItem({int height = 50, int width = 50, PreviewItem previewItem})
      : this.height = height,
        this.width = width,
        this.previewItem = previewItem ?? PreviewItem.origin();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: this.height.toDouble(),
            width: this.width.toDouble(),
            decoration: BoxDecoration(
                color: Colors.amber[600],
                borderRadius: const BorderRadius.all(const Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  this.previewItem.imageUrl,
                  fit: BoxFit.fill,
                ),
                Icon(Icons.play_arrow, size: 50, color: Colors.white,)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.previewItem.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  this.previewItem.performer,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
