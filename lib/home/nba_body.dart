import 'package:flutter/material.dart';
import 'package:hupu/app/request.dart';
import 'package:hupu/home/competition.dart';
import 'package:hupu/home/schedule_item.dart';
import 'package:hupu/utility/toast.dart';

class NbaBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NbaBodyState();
  }
}

class NbaBodyState extends State<NbaBody> {
  Competition competition;

  getCompetition() async {
    try {
      //请求登录
      var response = await Request.post(action: 'competition', params: {});
      setState(() {
        competition = Competition.fromJson(response);
      });
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCompetition();
  }

  @override
  Widget build(BuildContext context) {
    return competition != null
        ? ScheduleItem(competition)
        : new Container(
            child: Text('加载中'),
          );
  }
}
