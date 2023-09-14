import 'package:equatable/equatable.dart';
import 'package:my_courses_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:my_courses_app/core/usecase/usecase.dart';
import 'package:my_courses_app/core/utils/typedef.dart';

class CreateUser extends UsecaseWthParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture call(CreateUserParams params) async => _repository.createUser(
    createdAt: params.createdAt,
    fullname: params.fullname,
    avatar: params.avatar
  );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.fullname,
    required this.avatar
  });

  const CreateUserParams.empty() :
    this(
        createdAt: '_empty.createdAt',
        fullname: '_empty.fullname',
        avatar: '_empty.avatar'
      );

  final String createdAt;
  final String fullname;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, fullname, avatar];
}