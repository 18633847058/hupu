import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';

class MeCell extends StatefulWidget {
  final VoidCallback onPressed;
  final String iconName;
  final String title;

  MeCell({this.title, this.iconName, this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return _MeCellState();
  }
}

class _MeCellState extends State<MeCell> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: HupuColor.white,
      child: InkWell(
        onTap: this.widget.onPressed,
        highlightColor: HupuColor.gray,
        child: Container(
          width: 60,
          // color: HupuColor.white,
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                this.widget.iconName,
                height: 40,
                width: 40,
                fit: BoxFit.fill,
              ),
              // SizedBox(height: 10),
              Text(this.widget.title, style: TextStyle(fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
