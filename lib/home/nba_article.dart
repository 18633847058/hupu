import 'package:flutter/material.dart';
import 'package:hupu/home/article_item.dart';
import 'package:hupu/model/article.dart';

class NbaArticle extends StatefulWidget {
  final List<Article> articles;

  NbaArticle({@required this.articles});

  @override
  State<StatefulWidget> createState() {
    return NbaArticleState();
  }
}

class NbaArticleState extends State<NbaArticle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: widget.articles.map((e) => ArticleItem(e)).toList(),
      ),
    );
  }
}
