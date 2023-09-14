part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends AuthenticationEvent {
  const CreateUserEvent({
    required this.createdAt,
    required this.fullname,
    required this.avatar
  });

  final String createdAt;
  final String fullname;
  final String avatar;

  @override
  List<Object> get props => [createdAt, fullname, avatar];
}

class GetUsersEvent extends AuthenticationEvent {
  const GetUsersEvent();
}
