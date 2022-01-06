class RegisterResponse {
  RegisterResponse({
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

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    username: json['username'],
    email: json['email'],
    nickname: json['nickname'],
    is_verified: json['is_verified'],
    registered_at: json['registered_at'],
  );
}

class LoginResponse {
  LoginResponse({
    required this.access_token,
    required this.token_type,
  });

  String access_token;
  String token_type;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      access_token: json['access_token'],
      token_type: json['token_type'],
  );
}