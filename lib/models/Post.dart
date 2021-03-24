import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String title;
  final String description;

  Post({
    this.id,
    this.title,
    this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["_id"] as String,
      title: json["title"] as String,
      description: json["description"] as String,
    );
  }
}
