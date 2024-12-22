class Post {
  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  final int? id;
  final String? title;
  final String? body;


  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json["id"], title: json["title"], body: json["body"]);
  }


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
  };

}