import 'package:bloc/bloc.dart';
import 'package:mobile_app_flutter/bloc-state/playlist-state.dart';
import 'package:mobile_app_flutter/events/playlist-event.dart';
import 'package:mobile_app_flutter/models/preview-item.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(PlaylistState.initial());

  void onAddItem(PreviewItem item) {
    print(item);

    add(AddEvent(item));
  }

  void onRemoveItem(PreviewItem item) {
    add(RemoveEvent(item));
  }

  @override
  Stream<PlaylistState> mapEventToState(PlaylistEvent event) async* {
    if (event is AddEvent) {
      state.playlist.add(event.value);

      yield PlaylistState(state.playlist);
    }

    if (event is RemoveEvent) {
      state.playlist.remove(event.value);

      yield PlaylistState(state.playlist);
    }
  }

}