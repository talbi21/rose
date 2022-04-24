import 'dart:convert';

ResponseUser responseUserFromJson(String str) =>
    ResponseUser.fromJson(json.decode(str));

String responseUserToJson(ResponseUser data) => json.encode(data.toJson());

class ResponseUser {
  ResponseUser({
    required this.resp,
    required this.message,
    required this.user,
  });

  bool resp;
  String message;
  User user;

  factory ResponseUser.fromJson(Map<String, dynamic> json) => ResponseUser(
        resp: json["resp"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "message": message,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.uid,
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.birthdate,
    required this.gender,
    required this.pictureId,
    required this.isVerified,
    required this.role,
  });

  int uid;
  String email;
  String password;
  String firstName;
  String lastName;
  String birthdate;
  String gender;
  String pictureId;
  bool isVerified;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uid: json["uid"] ?? 0,
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? '',
        birthdate: json["birthdate"] ?? '',
        gender: json["gender"] ?? '',
        pictureId: json["pictureId"] ?? '',
        isVerified: json["isVerified"] ?? false,
        role: json["role"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "birthdate": birthdate,
        "gender": gender,
        "pictureId": pictureId,
        "isVerified": isVerified,
        "role": role,
      };
}
