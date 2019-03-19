import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/me/me_cell.dart';
import 'package:hupu/me/me_header.dart';
import 'package:hupu/utility/screen.dart';

class MeScene extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(color: HupuColor.white,),
        preferredSize: Size(Screen.width, 0),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            MeHeader(),
            SizedBox(height: 5),
            Expanded(
              child: buildCells(context),
            )
          ],
        ),
      ),
    );
  }

  Widget buildCells(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.2,
      children: <Widget>[
        MeCell(
          title:'收藏',
          iconName: 'images/icon_collection.png',
          onPressed: (){
            print('shoucang');
          }
        ),
        MeCell(
          title:'信息',
          iconName: 'images/icon_message.png',
          onPressed: (){
            print('xinxi');
          }
        ),
        MeCell(
          title:'历史',
          iconName: 'images/icon_history.png',
          onPressed: (){
            print('lishi');
          }
        ),
        MeCell(
          title:'帖子',
          iconName: 'images/icon_post.png',
          onPressed: (){
            print('tiezi');
          }
        ),
        MeCell(
          title:'金豆',
          iconName: 'images/icon_bean.png',
          onPressed: (){
            print('jindou');
          }
        ),
        MeCell(
          title:'虎扑币',
          iconName: 'images/icon_hupu.png',
          onPressed: (){
            print('hupubi');
          }
        ),
        MeCell(
          title:'反馈',
          iconName: 'images/icon_response.png',
          onPressed: (){
            print('fankui');
          }
        ),
        MeCell(
          title:'夜间',
          iconName: 'images/icon_night.png',
          onPressed: (){
            print('yejian');
          }
        ),
        MeCell(
          title:'设置',
          iconName: 'images/icon_setup.png',
          onPressed: (){
            print('shezhi');
          }
        ),
      ],
    );
  }
}