import 'package:crud/models/Post.dart';
import 'package:crud/services/HttpSevice.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  final Post post;
  EditPost({@required this.post});

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  Post newPost = Post.empty();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  Widget _titleBuilder() {
    return TextFormField(
        initialValue: widget.post.title,
        decoration: InputDecoration(labelText: 'post title'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'field is required';
          }
        },
        onSaved: (String value) {
          print('saved $value');
          newPost.title = value;
        });
  }

  Widget _descriptionBuilder() {
    return TextFormField(
        initialValue: widget.post.description,
        decoration: InputDecoration(labelText: 'post description'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'field is required';
          }
        },
        onSaved: (String value) {
          print('saved $value');
          newPost.description = value;
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

                    await httpService.updatePost(
                        widget.post.id, newPost.toJson());
                    Navigator.of(context).pop();
                  },
                  child: Text('Update'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
