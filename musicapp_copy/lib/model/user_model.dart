import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;


  UserModel({
    this.name,
    this.email,

  });

  UserModel copyWith({
    String name,
    String email,

  })
  {
    return UserModel(
        name: name ?? this.name,
        email: email ?? this.email,

    );
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map){
    if (map == null) return null;

    return UserModel(
        name: map['name'],
        email: map['email'],

    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(name: $name, email: $email,)';

  @override
  bool operator == (Object o){
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.name == name &&
        o.email == email;
  }
}