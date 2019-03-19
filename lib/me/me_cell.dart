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
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false; 
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.onPressed,
      onTapCancel: _handleTapCancel,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        color: _highlight ? HupuColor.gray :HupuColor.white,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              this.widget.iconName,
              height: 40,
              width: 40,
              fit: BoxFit.fill,
            ),
            // SizedBox(height: 10),
            Text(this.widget.title, style:TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
  
}