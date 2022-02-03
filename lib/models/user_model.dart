class User {
  User({
    required this.username,
    this.email = '',
    required this.nickname,
    required this.is_verified,
    required this.registered_at,
    this.detail = const UserDetail(
        desc: '',
        num_posts: 0,
        num_followers: 0,
        num_followings: 0,
        num_completed_todos: 0
    ),
  });

  String username;
  String email;
  String nickname;
  bool is_verified;
  String registered_at;
  UserDetail detail = emptyUserDetail;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'],
    email: json['email'],
    nickname: json['nickname'],
    is_verified: json['is_verified'],
    registered_at: json['registered_at'],
    detail: json['detail'] != null ? UserDetail.fromJson(json['detail']) : emptyUserDetail,
  );
}

class UserDetail {
  const UserDetail({
    required this.desc,
    required this.num_posts,
    required this.num_followers,
    required this.num_followings,
    required this.num_completed_todos,
  });

  final String desc;
  final int num_posts;
  final int num_followers;
  final int num_followings;
  final int num_completed_todos;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    desc: json['desc'],
    num_posts: json['num_posts'],
    num_followers: json['num_followers'],
    num_followings: json['num_followings'],
    num_completed_todos: json['num_completed_todos']
  );
}

UserDetail emptyUserDetail = UserDetail(
  desc: '',
  num_posts: 0,
  num_followers: 0,
  num_followings: 0,
  num_completed_todos: 0
);

class UserList {
  UserList({
    required this.userList,
  });

  List<User> userList;

  factory UserList.fromJson(List<dynamic> jsonList) => UserList(
    userList: jsonList.map((json) => User.fromJson(json)).toList(),
  );
}