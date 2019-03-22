import 'package:flutter/material.dart';
import 'package:hupu/app/request.dart';
import 'package:hupu/home/nba_schedule.dart';
import 'package:hupu/home/nba_video.dart';
import 'package:hupu/home/video_item.dart';
import 'package:hupu/model/competition.dart';
import 'package:hupu/model/video.dart';
import 'package:hupu/utility/toast.dart';

class NbaBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NbaBodyState();
  }
}

class NbaBodyState extends State<NbaBody> {
  List<Competition> competitions = new List();
  List<Video> videos = new List();

  getCompetition() async {
    try {
      //请求登录
      var response = await Request.post(action: 'competition', params: {});
      var videoResponse = await Request.post(action: 'video', params: {});
      setState(() {
        Competition competition = Competition.fromJson(response);
        Video video = Video.formJson(videoResponse);
        competitions.add(competition);
        competitions.add(competition);
        competitions.add(competition);
        competitions.add(competition);
        videos.add(video);
        videos.add(video);
        videos.add(video);
        videos.add(video);
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCompetition();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          competitions != null
              ? NbaSchedule(competitions: competitions)
              : new Container(),
          NbaVideo(videos: videos),
        ],
      ),
    );
  }


  Widget buildButtons() {
    return 
  }
}
