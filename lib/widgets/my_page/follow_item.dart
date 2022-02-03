import 'package:flutter/material.dart';
import 'package:flutter_todo/models/user_model.dart';

enum FollowOptions {
  following,
  follower,
}

class FollowItem extends StatelessWidget {
  const FollowItem({
    Key? key,
    required this.user,
    required this.option,
  }) : super(key: key);

  final User user;
  final FollowOptions option;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Container(
            width: 60,
            color: Colors.amber,
          ),
          Column(
            children: [
              Text(user.username),
              Text(user.nickname),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: Text('삭제')
          )
        ],
      ),
    );
  }
}
