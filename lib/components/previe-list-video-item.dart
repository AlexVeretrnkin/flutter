import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PreviewListVideoItem extends StatefulWidget {
  final videoUrl;

  PreviewListVideoItem({Key key, String videoUrl}) :
        this.videoUrl = videoUrl,
        super(key: key)
  ;

  @override
  _PreviewListVideoItemState createState() => _PreviewListVideoItemState(this.videoUrl);
}

class _PreviewListVideoItemState extends State<PreviewListVideoItem> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  String videoUrl;

  _PreviewListVideoItemState(this.videoUrl);

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      this.videoUrl,
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          // Use a FutureBuilder to display a loading spinner while waiting for the
          // VideoPlayerController to finish initializing.
          height: 100,
          width: 200,
          clipBehavior: Clip.hardEdge,
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
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: GestureDetector(
                    onTapDown: (_e) => _controller.play(),
                    onTapUp: (_e) => _controller.pause(),
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),// This trailing comma makes auto-formatting nicer for build methods.
        ),
        SizedBox(width: 10,)
      ],
    );
  }
}
