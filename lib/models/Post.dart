import 'package:flutter/foundation.dart';

class Post {
  String id;
  String title;
  String description;

  Post({
    this.id,
    this.title,
    this.description,
  });

  Post.empty() ;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["_id"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
    );
  }
  Map<String, dynamic> toJson() => {"title": title, "description": description};
}
