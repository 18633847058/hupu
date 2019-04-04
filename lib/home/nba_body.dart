import 'package:flutter/material.dart';
import 'package:hupu/app/request.dart';
import 'package:hupu/home/nba_article.dart';
import 'package:hupu/home/nba_schedule.dart';
import 'package:hupu/home/nba_video.dart';
import 'package:hupu/me/me_cell.dart';
import 'package:hupu/model/article.dart';
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
  List<Article> articles = new List();
  bool down = false;

  ScrollController _scrollController = new ScrollController();

  getData() async {
    try {
      List competitionResponse =
          await Request.post(action: 'competition', params: {});
      List videoResponse = await Request.post(action: 'video', params: {});
      List articleResponse = await Request.post(action: 'article', params: {});
      setState(() {
        articles.addAll(
            articleResponse.map((e) => new Article.fromJson(e)).toList());
        competitions.addAll(competitionResponse
            .map((e) => new Competition.fromJson(e))
            .toList());
        videos.addAll(videoResponse.map((e) => new Video.fromJson(e)).toList());
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMore();
      }
    });
  }

  _getMore() async {
    try {
      if (articles.length < 20) {
        List articleResponse = await Request.post(action: 'more', params: {});
        setState(() {
          articles.addAll(
              articleResponse.map((e) => new Article.fromJson(e)).toList());
        });
      } else {
        setState(() {
          down = true;
        });
      }
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          competitions != null
              ? NbaSchedule(competitions: competitions)
              : new Container(),
          NbaVideo(videos: videos),
          buildButtons(),
          NbaArticle(articles: articles),
          down
              ? Center(
                  child: Text("只有这么多了"),
                )
              : new Container()
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
          boxShadow: [BoxShadow()]),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              left: 50,
              child: MeCell(
                  title: '赛程',
                  iconName: 'images/icon_event.png',
                  onPressed: () {
                    print('saicheng');
                  })),
          MeCell(
              title: '排行',
              iconName: 'images/icon_rank.png',
              onPressed: () {
                print('panghang');
              }),
          Positioned(
              right: 50,
              child: MeCell(
                  title: '流言',
                  iconName: 'images/icon_talk.png',
                  onPressed: () {
                    print('liuyan');
                  })),
        ],
      ),
    );
  }
}
