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
      height: 74,
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.username,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(user.nickname,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff989898),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              // primary: Colors.blueGrey
              // backgroundColor: Colors.blueGrey
            ),
            onPressed: () {},
            child: Text('삭제')
          )
        ],
      ),
    );
  }
}
