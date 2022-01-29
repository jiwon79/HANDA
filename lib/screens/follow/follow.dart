import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/follow/follower_list.dart';
import 'package:flutter_todo/screens/follow/following_list.dart';
import 'package:flutter_todo/screens/follow/group_list.dart';


class FollowPage extends StatelessWidget {
  const FollowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: '팔로잉'),
              Tab(text: '팔로워'),
              Tab(text: '그룹'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FollowingList(),
            FollowerList(),
            GroupList(),
          ],
        ),
      ),
    );
  }
}
