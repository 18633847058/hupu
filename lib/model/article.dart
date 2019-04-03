class Article {
  String title;
  String imageUrl;

  Article(this.title, this.imageUrl);

  Article.fromJson(Map json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
