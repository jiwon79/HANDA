class MyDataResponse {
  MyDataResponse({
    required this.username,
    required this.email,
    required this.nickname,
    required this.is_verified,
    required this.registered_at,
  });

  String username;
  String email;
  String nickname;
  bool is_verified;
  String registered_at;

  factory MyDataResponse.fromJson(Map<String, dynamic> json) => MyDataResponse(
    username: json['username'],
    email: json['email'],
    nickname: json['nickname'],
    is_verified: json['is_verified'],
    registered_at: json['registered_at'],
  );
}

class UserDataResponse {
  UserDataResponse({
    required this.username,
    required this.nickname,
    required this.is_verified,
    required this.registered_at,
  });

  String username;
  String nickname;
  bool is_verified;
  String registered_at;

  factory UserDataResponse.fromJson(Map<String, dynamic> json) => UserDataResponse(
    username: json['username'],
    nickname: json['nickname'],
    is_verified: json['is_verified'],
    registered_at: json['registered_at'],
  );
}