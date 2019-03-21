import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hupu/home/competition.dart';

class ScheduleItem extends StatelessWidget {
  final Competition competition;

  ScheduleItem(this.competition);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow()]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SvgPicture.asset('logo/' + competition.hostTeamLogo,
                    width: 50, height: 50),
                SizedBox(width: 5),
                Text(
                  competition.hostTeam,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 40),
                Text(
                  competition.hostGoal.toString(),
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            Row(
              children: <Widget>[
                SvgPicture.asset('logo/' + competition.guestTeamLogo,
                    width: 50, height: 50),
                SizedBox(width: 5),
                Text(
                  competition.guestTeam,
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: 40),
                Text(
                  competition.guestGoal.toString(),
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  competition.type == 0 ? '常规赛' : '季后赛',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(width: 50),
                Text(
                  getState(competition.state),
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String getState(int state) {
    switch (state) {
      case 0:
        return '未开始';
      case 1:
        return '进行中';
      case 2:
        return '已结束';
      default:
        return '未开始';
    }
  }
}
