import 'package:flutter/material.dart';
import 'package:flutter_todo/models/user_model.dart';
import 'package:flutter_todo/widgets/follow/alert_unfollow_widget.dart';

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
          followButton(context, option, user),
        ],
      ),
    );
  }
}

Widget followButton(BuildContext context, FollowOptions option, User user) {
  switch (option) {
    case FollowOptions.follower:
      return SizedBox(
        height: 30,
        width: 50,
        child: OutlinedButton(
            onPressed: () {
              alertUnfollowWidget(context, user);
            },
            child: Text('삭제',
              style: followButtonTextStyle
            ),
          style: followButtonOutlinedStyle
        ),
      );
    case FollowOptions.following:
      return SizedBox(
        height: 30,
        width: 80,
        child: OutlinedButton(
            onPressed: () {},
            child: Text('팔로잉',
              style: followButtonTextStyle
            ),
          style: followButtonOutlinedStyle,
        ),
      );
    default:
      return Text('');
  }
}

TextStyle followButtonTextStyle = TextStyle(
  fontSize: 13,
  fontFamily: 'noto',
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

ButtonStyle followButtonOutlinedStyle = OutlinedButton.styleFrom(
    padding: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 1
      ),
      borderRadius: BorderRadius.all(Radius.circular(4))
    ),
);
