import 'package:crud/models/Post.dart';
import 'package:crud/pages/editPost.dart';
import 'package:crud/services/HttpSevice.dart';
import 'package:flutter/material.dart';

class SingelPost extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();
  SingelPost({@required this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EditPost(post: post)));
              })
        ],
        title: Text(post.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () async {
          await httpService.deletePost(post.id);
          Navigator.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text('title'),
                subtitle: Text(post.title),
              ),
              ListTile(
                title: Text('Description'),
                subtitle: Text(post.description),
              ),
              ListTile(
                title: Text('id'),
                subtitle: Text(post.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
