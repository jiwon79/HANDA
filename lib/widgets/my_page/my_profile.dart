import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/user.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = Provider.of<UserData>(context).user.username;
    String nickname = Provider.of<UserData>(context).user.nickname;
    int followerNum = Provider.of<UserData>(context).user.detail.num_followers;
    int followingNum = Provider.of<UserData>(context).user.detail.num_followings;
    int todoDoneCount = Provider.of<UserData>(context).user.detail.num_completed_todos;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(10, 16, 13, 18),
      height: 124,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Color(0xffededed))
          )
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            color: Colors.amber,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(username,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'noto',
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Container(
                      height: 21,
                      width: 72,
                      child: OutlinedButton(
                        onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                              side: BorderSide(color: Colors.red)
                            )
                          ),
                        child: Text('프로필 편집',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'noto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        )
                      ),
                    ),
                    Icon(Icons.settings, size: 16,),
                  ],
                ),
                Row(
                  children: [
                    Text('게시물 0',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text('팔로워 ${followerNum.toString()}',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text('팔로잉 ${followingNum.toString()}',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'noto',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                Text('총 이룬 To Do 개수 ${todoDoneCount.toString()}개',
                  style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'noto',
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(nickname),
              ],
            ),
          )
        ],
      ),
    );
  }
}
