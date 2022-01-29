class UserData {
  UserData({
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

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    username: json['username'],
    email: json['email'],
    nickname: json['nickname'],
    is_verified: json['is_verified'],
    registered_at: json['registered_at'],
  );
}