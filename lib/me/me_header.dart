import 'package:flutter/material.dart';
import 'package:hupu/app/app_navigator.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/app/user_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = UserManager.currentUser;
    return GestureDetector(
      onTap: () {
        if (UserManager.instance.isLogin) {
          AppNavigator.pushWeb(
              context, "https://github.com/18633847058", 'github');
        } else {
          AppNavigator.pushLogin(context);
        }
      },
      child: Container(
          color: HupuColor.white,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: user?.avatarUrl != null
                          ? CachedNetworkImageProvider(user.avatarUrl)
                          : AssetImage('images/placeholder_avatar.png'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      user != null ? user.nickname : '未登录',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
