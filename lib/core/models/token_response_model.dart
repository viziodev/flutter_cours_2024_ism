import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TokenResponseModel {
    int id;
    String token;
    String username;
    List<String> roles;
  TokenResponseModel({
    required this.id,
    required this.token,
    required this.username,
    required this.roles,
  });
   

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'username': username,
      'roles': roles,
    };
  }

  factory TokenResponseModel.fromMap(Map<String, dynamic> map) {
    return TokenResponseModel(
      id: map['id'] as int,
      token: map['token'] as String,
      username: map['username'] as String,
      roles: []
      //List<String>.from((map['roles'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenResponseModel.fromJson(String source) => TokenResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
