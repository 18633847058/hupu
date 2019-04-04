import 'package:flutter/material.dart';
import 'package:hupu/competition/competition_scene.dart';
import 'package:hupu/me/login_scene.dart';
import 'package:hupu/me/web_scene.dart';
import 'package:hupu/model/competition.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => scene,
        ));
  }

  static pushLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScene();
    }));
  }

  static pushWeb(BuildContext context, String url, String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebScene(url: url, title: title);
    }));
  }

  static pushCompetition(BuildContext context, Competition competition) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CompetitionScene(competition);
    }));
  }
}
