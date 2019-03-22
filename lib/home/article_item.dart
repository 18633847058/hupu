import 'package:flutter/material.dart';
import 'package:hupu/model/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem({this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(),
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
