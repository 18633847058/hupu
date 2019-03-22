import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScene extends StatefulWidget {
  final String url;

  VideoScene({@required this.url});

  @override
  State<StatefulWidget> createState() {
    return VideoSceneState();
  }
}

class VideoSceneState extends State<VideoScene> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        width: 250,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow()],
        ),
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
