import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synergy_flutter/domain/entities/post.dart';

class PostListTile extends StatelessWidget {
  const PostListTile({Key key, @required this.post, this.onTap})
      : super(key: key);
  final Post post;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title ?? "제목 없음"),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
