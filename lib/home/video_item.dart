import 'package:flutter/material.dart';
import 'package:hupu/model/video.dart';

class VideoItem extends StatelessWidget {
  final Video video;

  const VideoItem(this.video);

  @override
  Widget build(BuildContext context) {
    return video == null
        ? Container()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow()]),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(child: Image.network(video.imageUrl)),
                Container(
                    child: Image.asset(
                  'images/icon_play.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                )),
                Positioned(
                  bottom: 0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 30, width: 300),
                    child: Container(
                      foregroundDecoration: new BoxDecoration(
                        gradient: new LinearGradient(
                            colors: [Colors.black54, Colors.black12],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  child: Text(video.title,
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                )
              ],
            ),
          );
  }
}
