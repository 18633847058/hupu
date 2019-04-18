import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeamCell extends StatelessWidget {
  final String teamName = "火箭";
  final String teamLogo = "HOU_logo.svg";

  // TeamCell(this.teamName, this.teamLogo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset('logo/' + teamLogo, width: 40, height: 40),
        SizedBox(width: 5),
        Container(
          width: 40,
          child: Text(
            teamName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
