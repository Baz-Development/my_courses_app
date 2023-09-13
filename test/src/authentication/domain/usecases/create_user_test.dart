import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_courses_app/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:my_courses_app/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();
  test(
    'should call the [AuthRepo.createUser]',
    () async {
      // Arrange

      // STUB
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          fullname: any(named: 'fullname'),
          avatar: any(named: 'avatar')
        )
      ).thenAnswer((_) async => const Right(null));

      // Act
      final result = await usecase(params);

      // Assert
      expect(result, equals(const Right<dynamic, void>(null)));

      verify(
        () => repository.createUser(
          createdAt: params.createdAt,
          fullname: params.fullname,
          avatar: params.avatar
        )
      ).called(1);

      verifyNoMoreInteractions(repository);
    }
  );
}