class User {
  User({
    required this.username,
    this.email = '',
    required this.nickname,
    required this.is_verified,
    required this.registered_at,
  });

  String username;
  String email;
  String nickname;
  bool is_verified;
  String registered_at;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'],
    email: json['email'],
    nickname: json['nickname'],
    is_verified: json['is_verified'],
    registered_at: json['registered_at'],
  );
}

class UserList {
  UserList({
    required this.userDataList,
  });

  List<User> userDataList;

  factory UserList.fromJson(List<dynamic> jsonList) => UserList(
    userDataList: jsonList.map((json) => User.fromJson(json)).toList(),
  );
}