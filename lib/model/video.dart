class Video {
  String title;
  String imageUrl;
  String videoUrl;

  Video.formJson(Map json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
    };
  }
}
