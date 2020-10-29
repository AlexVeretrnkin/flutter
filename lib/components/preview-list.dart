import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_flutter/%20bloc/playlist-bloc.dart';
import 'package:mobile_app_flutter/bloc-state/playlist-state.dart';
import 'package:mobile_app_flutter/components/previe-list-video-item.dart';
import 'package:mobile_app_flutter/components/preview-list-item.dart';
import 'package:mobile_app_flutter/enum/option.dart';
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

  Future<Option> _askedToLead(BuildContext context) async {
    return await showDialog<Option>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.like);
                },
                child: const Text('Like'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.dislike);
                },
                child: const Text('Dislike'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Option.addToPlaylist);
                },
                child: const Text('Add to Playlist'),
              ),
            ],
          );
        });
  }

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
                      child: BlocBuilder<PlaylistBloc, PlaylistState>(
                        builder: (context, state) {
                          return PreviewListItem(
                              height: 100,
                              width: item.width,
                              previewItem: item
                          );
                        },
                      ),
                      onTap: () async {
                       Option res = await _askedToLead(context);

                        switch(res) {
                          case Option.like:
                            value.like(item);
                            break;
                          case Option.dislike:
                            value.dislike(item);
                            break;
                          case Option.addToPlaylist:
                              context.bloc<PlaylistBloc>().onAddItem(item);
                            break;
                        }
                      },
                    ):
                    PreviewListVideoItem(videoUrl: item.videoUrl)
                ).toList()

            ));
      },
    );
  }
}
