import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/app/request.dart';
import 'package:hupu/app/user_manager.dart';
import 'package:hupu/me/code_button.dart';
import 'package:hupu/utility/toast.dart';

class LoginScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginSceneState();
}

class LoginSceneState extends State<LoginScene> {
  TextEditingController phoneEditor = TextEditingController();
  TextEditingController codeEditor = TextEditingController();

  int coldDownSeconds = 0;
  Timer timer;

  colddown() {
    timer = Timer(Duration(seconds: 1), () {
      setState(() {
        --coldDownSeconds;
      });
      colddown();
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }

  fetchSmsCode() async {
    if (phoneEditor.text.length == 0) {
      return;
    }
    try {
      //请求验证码
      await Request.post(
        action: 'sms',
        params: {'phone': phoneEditor.text, 'type': 'login'},
      );
      setState(() {
        coldDownSeconds = 60;
      });
      colddown();
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  login() async {
    var phone = phoneEditor.text;
    var code = codeEditor.text;

    try {
      //请求登录
      var response = await Request.post(action: 'login', params: {
        'phone': phone,
        'code': code,
      });
      UserManager.instance.login(response);
      Navigator.pop(context);
    } catch (e) {
      Toast.show(e.toString());
    }
  }

  Widget buildPhone() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: HupuColor.paper,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: phoneEditor,
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 14, color: HupuColor.darkGray),
        decoration: InputDecoration(
          hintText: '请输入手机号',
          hintStyle: TextStyle(color: HupuColor.gray),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildCode() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: HupuColor.paper,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: codeEditor,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 14, color: HupuColor.darkGray),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: HupuColor.gray),
                hintText: '请输入短信验证码',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(color: HupuColor.separated, width: 1, height: 40),
          CodeButton(
            onPressed: fetchSmsCode,
            coldDownSeconds: coldDownSeconds,
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildPhone(),
              SizedBox(height: 10),
              buildCode(),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: HupuColor.primary,
                ),
                height: 40,
                child: FlatButton(
                  onPressed: login,
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录'), elevation: 0),
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }
}
