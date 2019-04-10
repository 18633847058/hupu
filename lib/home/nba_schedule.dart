import 'package:flutter/material.dart';
import 'package:hupu/app/app_navigator.dart';
import 'package:hupu/home/schedule_item.dart';
import 'package:hupu/model/competition.dart';

class NbaSchedule extends StatefulWidget {
  final List<Competition> competitions;

  NbaSchedule({@required this.competitions});

  @override
  State<StatefulWidget> createState() {
    return NbaScheduleState();
  }
}

class NbaScheduleState extends State<NbaSchedule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
        children: widget.competitions
            .map((e) => ScheduleItem(e, () {
                  AppNavigator.pushCompetition(context, e);
                }))
            .toList(),
      ),
    );
  }
}
