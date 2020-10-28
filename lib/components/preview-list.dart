import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/components/previe-list-video-item.dart';
import 'package:mobile_app_flutter/components/preview-list-item.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';
import 'package:mobile_app_flutter/providers/preview-item-provider.dart';
import 'package:provider/provider.dart';

class PreviewList extends StatelessWidget {
  final double height;
  final List<PreviewItem> previewData;

  PreviewList(List<PreviewItem> previewData, {int height = 160}) :
        this.height = height.toDouble(),
        this.previewData = previewData
  ;

  @override
  Widget build(BuildContext context) {
    return Consumer<PreviewItemProvider>(
      builder: (context, value, child) {
        return Container(
            height: this.height,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: this.previewData
                    .map<Widget>(
                        (PreviewItem item) => item.imageUrl != null ?
                    GestureDetector(
                      child: PreviewListItem(
                          height: 100,
                          width: item.width,
                          previewItem: item
                      ),
                      onTap: () => value.like(item),
                    ):
                    PreviewListVideoItem(videoUrl: item.videoUrl)
                ).toList()

            ));
      },
    );
  }
}
