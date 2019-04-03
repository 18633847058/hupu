import 'package:flutter/material.dart';
import 'package:hupu/app/hupu_color.dart';
import 'package:hupu/model/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text(
                  article.title,
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Icon(Icons.comment, color: HupuColor.gray),
                    SizedBox(width: 5),
                    Text('125', style: TextStyle(color: HupuColor.gray)),
                    SizedBox(width: 20),
                    Icon(Icons.thumb_up, color: HupuColor.gray),
                    SizedBox(width: 5),
                    Text('3', style: TextStyle(color: HupuColor.gray))
                  ],
                )
              ],
            ),
          ),
          Image.network(
            article.imageUrl,
            width: 100,
            height: 80,
          )
        ],
      ),
    );
  }
}
