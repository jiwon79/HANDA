import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/todo.dart';
import 'package:flutter_todo/provider/user.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = Provider.of<UserData>(context).user.username;
    String nickname = Provider.of<UserData>(context).user.nickname;
    int followerNum = Provider.of<UserData>(context).followerCount;
    int followingNum = Provider.of<UserData>(context).followingCount;
    int todoDoneCount = Provider.of<TodoData>(context).todoDoneCount;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 124,
      child: Row(
        children: [
          Container(
            width: 124,
            color: Colors.amber,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(username),
                  TextButton(
                    onPressed: () {},
                    child: Text('프로필 편집')
                  ),
                  Icon(Icons.settings),
                ],
              ),
              Row(
                children: [
                  Text('게시물 0'),
                  Text('팔로워 ${followerNum.toString()}'),
                  Text('팔로잉 ${followingNum.toString()}'),
                ],
              ),
              Text('총 이룬 To Do 개수 ${todoDoneCount.toString()}개'),
              Text(nickname),
            ],
          )
        ],
      ),
    );
  }
}
