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
          backgroundColor: Color(0xfff8f8fa),
          elevation: 0,
          title: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffc4c4c4),
                  width: 1
                )
              ),
            ),
            child: TabBar(
              indicatorColor: Color(0xff000000),
              unselectedLabelColor: Color(0xffA6A6A6),
              labelColor: Color(0xff000000),
              tabs: [
                Tab(
                  child: Text("팔로잉")
                ),
                Tab(text: '팔로워'),
                Tab(text: '그룹'),
              ],
            ),
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
