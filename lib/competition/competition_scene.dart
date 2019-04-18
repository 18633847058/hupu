import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/competition/score_cell.dart';
import 'package:hupu/model/competition.dart';
import 'package:hupu/utility/screen.dart';

class CompetitionScene extends StatelessWidget {
  final Competition competition;

  CompetitionScene(this.competition);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(color: HupuColor.white),
        preferredSize: Size(Screen.width, 0),
      ),
      body: ScoreCell(title: "战绩"),
    );
  }
}
