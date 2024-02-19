class UserData{
  String token;
  String username;
  String refreshToken;
  int expiresIn;
  String avatar;

  UserData(
      {required this.token,
      required this.username,
      required this.refreshToken,
      required this.expiresIn,
      required this.avatar});

  static UserData fromJson(Map<String, dynamic> json) {
    return UserData(
      token: json['access_token'],
      username: json['user']['name'],
      refreshToken: json['refresh_token'],
      expiresIn: json['expires_in'],
      avatar: json['user_image'],
    );
  }
}