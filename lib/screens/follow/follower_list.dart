import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/user.dart';
import 'package:flutter_todo/widgets/my_page/follow_item.dart';
import 'package:provider/provider.dart';

class FollowerList extends StatefulWidget {
  const FollowerList({Key? key}) : super(key: key);

  @override
  _FollowerListState createState() => _FollowerListState();
}

class _FollowerListState extends State<FollowerList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<UserData>(context, listen: false).getFollowers(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Network Error');
        } else {
          return ListView.builder(
            itemCount: Provider.of<UserData>(context).followerCount,
            itemBuilder: (BuildContext context, int index) {
              return FollowItem(
                user: Provider.of<UserData>(context).followerList[index],
                option: FollowOptions.follower,
              );
            }
          );
        }
      },
    );
  }
}