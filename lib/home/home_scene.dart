import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/home/nba_body.dart';
import 'package:hupu/home/search_input.dart';

class HomeScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSceneState();
  }
}

class HomeSceneState extends State<HomeScene>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["关注", "NBA", "中国篮球", "欧冠"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/icon_logo.png',
                  width: 100,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(width: 8),
                Expanded(child: buildSearchInput(context))
              ],
            ),
          ),
          bottom: Row(
            children: <Widget>[
              TabBar(
                indicatorColor: HupuColor.primary,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                labelStyle: new TextStyle(fontSize: 16.0),
                unselectedLabelStyle: new TextStyle(fontSize: 14.0),
                tabs: tabs.map((e) => Tab(text: e)).toList(),
                controller: _tabController,
              )
            ],
          )),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: NbaBody(),
          );
        }).toList(),
      ),
    );
  }
}

Widget buildSearchInput(BuildContext context) {
  return SearchInput((value) {}, (value) {}, () {});
}
