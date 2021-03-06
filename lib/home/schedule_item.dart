import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/model/competition.dart';

class ScheduleItem extends StatelessWidget {
  final Competition competition;
  final VoidCallback onPressed;

  ScheduleItem(this.competition, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 160,
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
                        width: 40, height: 40),
                    SizedBox(width: 5),
                    Container(
                      width: 40,
                      child: Text(
                        competition.hostTeam,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      competition.hostGoal.toString(),
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SvgPicture.asset('logo/' + competition.guestTeamLogo,
                        width: 40, height: 40),
                    SizedBox(width: 5),
                    Container(
                      width: 40,
                      child: Text(
                        competition.guestTeam,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      competition.guestGoal.toString(),
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                SizedBox(height: 10),
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
                      style: TextStyle(
                          fontSize: 10, color: getColor(competition.state)),
                    )
                  ],
                )
              ],
            ),
          ),
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

  Color getColor(int state) {
    switch (state) {
      case 0:
      case 2:
        return HupuColor.gray;
      default:
        return HupuColor.primary;
    }
  }
}
