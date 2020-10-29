import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.thumb_up),
          title: Text('Liked items'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => Navigator.pushNamed(context, '/likes'),
        ),
        ListTile(
          leading: Icon(Icons.thumb_down),
          title: Text('Disliked items'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => Navigator.pushNamed(context, '/dislikes'),
        ),
        ListTile(
          leading: Icon(Icons.playlist_play),
          title: Text('Your playlist'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => Navigator.pushNamed(context, '/playlist'),
        ),
      ],
    );
  }
}
