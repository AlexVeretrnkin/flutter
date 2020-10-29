import 'package:mobile_app_flutter/models/preview-item.dart';

class PlaylistState {
  final List<PreviewItem> playlist;

  const PlaylistState(this.playlist);

  factory PlaylistState.initial() => PlaylistState(new List());
}