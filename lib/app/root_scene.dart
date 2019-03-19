import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hupu/app/constant.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/community/community_scene.dart';
import 'package:hupu/global.dart';
import 'package:hupu/home/home_scene.dart';
import 'package:hupu/me/me_scene.dart';
import 'package:hupu/store/store_scene.dart';
import 'package:hupu/utility/event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootSceneState();
  }
}

class RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isFinishSetup = false;
  List<Image> _tabImages = [
    Image.asset("images/tab_home_n.png"),
    Image.asset("images/tab_community_n.png"),
    Image.asset("images/tab_store_n.png"),
    Image.asset("images/tab_me_n.png")
  ];

  List<Image> _tabSelectedImages = [
    Image.asset("images/tab_home_p.png"),
    Image.asset("images/tab_community_p.png"),
    Image.asset("images/tab_store_p.png"),
    Image.asset("images/tab_me_p.png"),
  ];

  @override
  void initState() {
    super.initState();
    setupApp();

    eventBus.on(EventToggleTabBarIndex, (arg) {
      setState(() {
        _tabIndex = arg;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventToggleTabBarIndex);
    super.dispose();
  }

  setupApp() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isFinishSetup) {
      return Container();
    }
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomeScene(),
          CommunityScene(),
          StoreScene(),
          MeScene()
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: HupuColor.primary,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text("虎扑")),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text("社区")),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text("识货")),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text("我")),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if ( index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
