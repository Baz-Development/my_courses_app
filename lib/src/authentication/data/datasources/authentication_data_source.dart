import 'package:my_courses_app/src/authentication/data/models/user_model.dart';

abstract class AuthenticationDataSource {
  Future<void> createUser({
    required String createdAt,
    required String fullname,
    required String avatar
  });

  Future<List<UserModel>> getUsers();
}