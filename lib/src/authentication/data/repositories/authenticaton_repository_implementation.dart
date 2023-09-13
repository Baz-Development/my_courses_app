import 'package:dartz/dartz.dart';
import 'package:my_courses_app/src/authentication/data/datasources/authentication_data_source.dart';
import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:my_courses_app/src/core/errors/exception.dart';
import 'package:my_courses_app/src/core/errors/failure.dart';
import 'package:my_courses_app/src/core/utils/typedef.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {
  final AuthenticationDataSource _datasource;


  const AuthenticationRepositoryImplementation(this._datasource);

  @override
  ResultFuture<void> createUser({
    required String createdAt,
    required String fullname,
    required String avatar
  }) async {
    try {
      await _datasource.createUser(createdAt: createdAt, fullname: fullname, avatar: avatar);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final response = await _datasource.getUsers();
      return Right(response);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

}