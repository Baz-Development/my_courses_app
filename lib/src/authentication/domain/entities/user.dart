import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.createdAt,
    required this.fullname,
    required this.avatar
  });

  const User.empty() :
      this(
        id: 1,
        createdAt: '_empty.createdAt',
        fullname: '_empty.fullname',
        avatar: '_empty.avatar'
      );

  final int id;
  final String createdAt;
  final String fullname;
  final String avatar;

  @override
  List<Object?> get props => [id];
}