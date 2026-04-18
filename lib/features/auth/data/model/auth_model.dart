  import 'dart:convert';

  /// name : "abhishek"
  /// password : "123456"

  AuthModel authModelFromJson(String str) =>
      AuthModel.fromJson(json.decode(str));

  String authModelToJson(AuthModel data) => json.encode(data.toJson());

  class AuthModel {
    AuthModel({this.name, this.password});

    AuthModel.fromJson(dynamic json) {
      name = json['name'];
      password = json['password'];
    }

    String? name;
    String? password;

    AuthModel copyWith({String? name, String? password}) => AuthModel(
      name: name ?? this.name,
      password: password ?? this.password,
    );

    Map<String, dynamic> toJson() {
      final map = <String, dynamic>{};
      map['name'] = name;
      map['password'] = password;
      return map;
    }
  }
