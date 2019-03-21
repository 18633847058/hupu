import 'package:flutter/material.dart';
import 'package:hupu/home/competition.dart';
import 'package:hupu/home/schedule_item.dart';

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
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(8),
        children: widget.competitions.map((e) => ScheduleItem(e)).toList(),
      ),
    );
  }
}
