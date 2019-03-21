import 'package:flutter/material.dart';
import 'package:hupu/app/request.dart';
import 'package:hupu/home/competition.dart';
import 'package:hupu/home/nba_schedule.dart';
import 'package:hupu/utility/toast.dart';

class NbaBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NbaBodyState();
  }
}

class NbaBodyState extends State<NbaBody> {
  List<Competition> competitions = new List();

  getCompetition() async {
    try {
      //请求登录
      var response = await Request.post(action: 'competition', params: {});
      setState(() {
        Competition competition = Competition.fromJson(response);
        competitions.add(competition);
        competitions.add(competition);
        competitions.add(competition);
        competitions.add(competition);
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
        ],
      ),
    );
  }
}
