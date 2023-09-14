import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:my_courses_app/core/usecase/usecase.dart';
import 'package:my_courses_app/core/utils/typedef.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {

  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() => _repository.getUsers();

}