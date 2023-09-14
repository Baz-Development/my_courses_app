import 'dart:convert';
import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/core/utils/typedef.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.createdAt,
    required super.fullname,
    required super.avatar,
  });

  const UserModel.empty() :
    this(
      id: '1',
      createdAt: '_empty.createdAt',
      fullname: '_empty.fullname',
      avatar: '_empty.avatar'
    );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel copyWith({
    String? avatar,
    String? id,
    String? fullname,
    String? createdAt,
  }) {
    return UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        fullname: fullname ?? this.fullname,
        avatar: avatar ?? this.avatar
    );
  }

  UserModel.fromMap(DataMap map) :
      this(
        id: map['id'] as String,
        createdAt: map['createdAt'] as String,
        fullname: map['fullname'] as String,
        avatar: map['avatar'] as String
      );

  DataMap toMap() => {
    'id': id,
    'createdAt': createdAt,
    'fullname': fullname,
    'avatar': avatar
  };

  String toJson() => jsonEncode(toMap());
}