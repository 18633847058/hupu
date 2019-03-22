import 'package:flutter/material.dart';
import 'package:hupu/home/video_item.dart';
import 'package:hupu/model/video.dart';

class NbaVideo extends StatefulWidget {
  final List<Video> videos;

  NbaVideo({@required this.videos});

  @override
  State<StatefulWidget> createState() {
    return NbaVideoState();
  }
}

class NbaVideoState extends State<NbaVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(8, 4, 8, 8),
        children: widget.videos.map((e) => VideoItem(e)).toList(),
      ),
    );
  }
}
