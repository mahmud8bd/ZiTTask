import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int userId;
  String userName;
  String userEmail;
  String userPhone;
  String userPassword;

  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    userName: json["userName"],
    userEmail: json["userEmail"],
    userPhone: json["userPhone"],
    userPassword: json["userPassword"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "userName": userName,
    "userEmail": userEmail,
    "userPhone": userPhone,
    "userPassword": userPassword,
  };
}
