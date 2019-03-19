import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/app/root_scene.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hupu",
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: HupuColor.lightGray,
        scaffoldBackgroundColor:HupuColor.paper,
      ),
      home: RootScene(),
    );
  }

}