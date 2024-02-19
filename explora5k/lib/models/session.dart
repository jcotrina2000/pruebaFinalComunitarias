class Session {
  String token;
  String username;
  String refreshToken;
  int expiresIn;
  String avatar;
  DateTime createdAt;

  Session(
      {required this.token,
      required this.username,
      required this.refreshToken,
      required this.expiresIn,
      required this.avatar,
      required this.createdAt});

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
        token: json['token'],
        username: json['username'],
        refreshToken: json['refreshToken'],
        expiresIn: json['expiresIn'],
        avatar: json['avatar'],
        createdAt: DateTime.parse(json['createdAt']));
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "username": username,
      "refreshToken": refreshToken,
      "expiresIn": expiresIn,
      "avatar": avatar,
      "createdAt": createdAt.toIso8601String()
    };
  }
}