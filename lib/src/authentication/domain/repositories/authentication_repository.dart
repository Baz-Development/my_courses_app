import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/src/core/utils/typedef.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  // Can return Failure or void
  ResultFuture<void> createUser({
    required String createdAt,
    required String fullname,
    required String avatar
  });

  // Can return Failure or List<User>
  ResultFuture<List<User>> getUsers();
}