//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  String? email;
  String? refresh;
  String? access;
  String? firstName;
  String? lastName;
  int hesquserrole;
  int id;

  LoginData({
    required this.email,
    required this.refresh,
    required this.access,
    required this.firstName,
    required this.lastName,
    required this.hesquserrole,
    required this.id,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        email: json["email"],
        refresh: json["refresh"],
        access: json["access"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        hesquserrole: json["hesquserrole"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "refresh": refresh,
        "access": access,
        "first_name": firstName,
        "last_name": lastName,
        "hesquserrole": hesquserrole,
        "id": id,
      };
}
