// To parse this JSON data, do
//
//     final dataUsers = dataUsersFromJson(jsonString);

import 'dart:convert';

DataUsers dataUsersFromJson(String str) => DataUsers.fromJson(json.decode(str));

String dataUsersToJson(DataUsers data) => json.encode(data.toJson());

class DataUsers {
    DataUsers({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    Users data;

    factory DataUsers.fromJson(Map<String, dynamic> json) => DataUsers(
        status: json["status"],
        message: json["message"],
        data: Users.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Users {
    Users({
        required this.email,
        required this.password,
    });

    String email;
    String password;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };
}
