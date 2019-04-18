import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/competition/team_cell.dart';

class ScoreCell extends StatefulWidget {
  final String title;

  ScoreCell({this.title});

  @override
  State<StatefulWidget> createState() {
    return ScoreCellState();
  }
}

class ScoreCellState extends State<ScoreCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HupuColor.gray,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                left: 8,
                top: 8,
                child: Icon(Icons.chevron_left),
              ),
              Center(
                  child: Text(
                widget.title,
                style: Theme.of(context).textTheme.title,
              ))
            ],
          ),
          Stack(
            children: <Widget>[
              Positioned(
                child: TeamCell(),
              ),
              Positioned(
                child: TeamCell(),
              )
            ],
          )
        ],
      ),
    );
  }
}
