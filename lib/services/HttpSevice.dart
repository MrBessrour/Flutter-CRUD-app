import 'dart:convert';

import 'package:crud/models/Post.dart';
import 'package:http/http.dart';

class HttpService {
  final postUrl = "http://192.168.1.5:8000/post";
  final Map<String, String> _headers = {"Content-type": "application/json"};

  Future<void> deletePost(String id) async {
    Response res = await delete('$postUrl/$id');
    if (res.statusCode == 200) {
      print('deleted');
    }
  }

  Future<void> updatePost(String id, Map p) async {
    Response res =
        await patch('$postUrl/$id', headers: _headers, body: json.encode(p));
    if (res.statusCode == 200) {
      print('deleted');
    }
  }

  Future<void> newPost(Map p) async {
    Response res = await post(postUrl, headers: _headers, body: json.encode(p));
    if (res.statusCode == 200) {
      print('post add');
    }
  }

  Future<List> getPosts() async {
    Response res = await get(postUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "can't get posts";
    }
  }
}
