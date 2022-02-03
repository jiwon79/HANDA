import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/user.dart';
import 'package:flutter_todo/widgets/my_page/follow_item.dart';
import 'package:provider/provider.dart';

class FollowerList extends StatelessWidget {
  const FollowerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Provider.of<UserData>(context).user.detail.num_followers,
        itemBuilder: (BuildContext context, int index) {
          return FollowItem(
            user: Provider.of<UserData>(context).followerList[index],
            option: FollowOptions.follower,
          );
        }
      )
    );
  }
}
