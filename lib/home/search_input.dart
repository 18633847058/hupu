import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';

class SearchInput extends StatelessWidget {
  final getResults;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onSubmitPressed;

  SearchInput(this.getResults, this.onSubmitted, this.onSubmitPressed);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40.0,
      decoration: BoxDecoration(
          color: HupuColor.paper, borderRadius: BorderRadius.circular(5)),
      child: new Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5, top: 3, left: 3),
            child: new Icon(Icons.search, size: 24, color: HupuColor.darkGray),
          ),
          Expanded(
            child: new TextField(
              style: TextStyle(fontSize: 14, color: HupuColor.gray),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: HupuColor.gray),
                hintText: '火箭总冠军',
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
