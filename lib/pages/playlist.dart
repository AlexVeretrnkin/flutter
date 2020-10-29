import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_flutter/%20bloc/playlist-bloc.dart';
import 'package:mobile_app_flutter/bloc-state/playlist-state.dart';
import 'package:mobile_app_flutter/components/library-item.dart';
import 'package:mobile_app_flutter/enum/option.dart';

class Playlist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return ListView(
          children: context.bloc<PlaylistBloc>().state.playlist.map(
                  (e) => GestureDetector(
                    child: LibraryItem(e, actionType: Option.addToPlaylist),
                    onTap: () => context.bloc<PlaylistBloc>().onRemoveItem(e),
                  )
          ).toList(),
        );
      },
    );
  }
  
}