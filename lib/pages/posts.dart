import 'package:crud/pages/SingelPost.dart';
import 'package:crud/services/HttpSevice.dart';
import 'package:flutter/material.dart';
import 'package:crud/models/Post.dart';

import 'newPost.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> NewPost()));
        },
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
                children: posts
                    .map((Post post) => ListTile(
                          title: Text(post.title),
                          subtitle: Text(post.id),
                          trailing: Icon(Icons.arrow_right),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SingelPost(post: post))),
                        ))
                    .toList());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
