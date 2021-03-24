import 'package:crud/models/Post.dart';
import 'package:crud/services/HttpSevice.dart';
import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Post post = Post.empty();

  Widget _titleBuilder() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'post title'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'field is required';
          }
        },
        onSaved: (String value) {
          print('saved $value');
          post.title = value;
        });
  }

  Widget _descriptionBuilder() {
    return TextFormField(
        decoration: InputDecoration(labelText: 'post description'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'field is required';
          }
        },
        onSaved: (String value) {
          print('saved $value');
          post.description = value;
        });
  }

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                _titleBuilder(),
                _descriptionBuilder(),
                RaisedButton(
                  onPressed: () async {
                    if (!_globalKey.currentState.validate()) {
                      return;
                    }
                    _globalKey.currentState.save();
                    print('$post');
                    await httpService.newPost(post.toJson());
                    Navigator.of(context).pop();
                  },
                  child: Text('save'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
