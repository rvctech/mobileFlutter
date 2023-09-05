// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  bool success;
  LoginData data;

  LoginResponse({
    required this.success,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        data: LoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class LoginData {
  String email;
  String refresh;
  String access;
  String firstName;
  String lastName;
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
