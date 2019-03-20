import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/home/search_input.dart';

class CommunityScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CommunitySceneState();
  }
}

class CommunitySceneState extends State<CommunityScene>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["关注", "热门", "板块"];

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
        bottom: TabBar(
          indicatorColor: HupuColor.primary,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ),
    );
  }
}

Widget buildSearchInput(BuildContext context) {
  return SearchInput((value) {}, (value) {}, () {});
}
