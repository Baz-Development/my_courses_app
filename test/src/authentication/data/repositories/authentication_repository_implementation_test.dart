import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_courses_app/src/authentication/data/datasources/authentication_data_source.dart';
import 'package:my_courses_app/src/authentication/data/repositories/authenticaton_repository_implementation.dart';
import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/core/errors/exception.dart';
import 'package:my_courses_app/core/errors/failure.dart';

class MockAuthDataSource extends Mock implements AuthenticationDataSource {}

void main() {
  late AuthenticationDataSource dataSource;
  late AuthenticationRepositoryImplementation repoImpl;

  setUp(() {
    dataSource = MockAuthDataSource();
    repoImpl = AuthenticationRepositoryImplementation(dataSource);
  });

  const tException = ApiException(message: "Internal server error", statusCode: 500);
  
  group('createUser', () {
    const createdAt = 'whatever.createdAt';
    const fullname = 'whatever.fullname';
    const avatar = 'whatever.avatar';

    test(
      'should call the [RemoteDataSource.createUser] and complete'
      'successfully when the call to the remote source is successful',
      () async {
        // Arrange
        // STUB
        when(
                () => dataSource.createUser(
                createdAt: any(named: 'createdAt'),
                fullname: any(named: 'fullname'),
                avatar: any(named: 'avatar')
            )
        ).thenAnswer((_) async => Future.value());


        // Act
        final result = await repoImpl.createUser(createdAt: createdAt, fullname: fullname, avatar: avatar);

        // Assert
        expect(result, equals(const Right(null)));
        verify(() => dataSource.createUser(createdAt: any(named: "createdAt"), fullname: any(named: "fullname"), avatar: any(named: "avatar"))).called(1);
        verifyNoMoreInteractions(dataSource);
      }
    );
    
    test(
      'should return a [ApiFailure] when the call to the remote'
      'source is unsuccessful',
      () async {
        // Arrange
        when(
                () => dataSource.createUser(
                createdAt: any(named: 'createdAt'),
                fullname: any(named: 'fullname'),
                avatar: any(named: 'avatar')
            )
        ).thenThrow(tException);
        // Act
        final result = await repoImpl.createUser(createdAt: createdAt, fullname: fullname, avatar: avatar);

        // Assert
        expect(result, equals(const Left(ApiFailure(message: "Internal server error", statusCode: 500))));
        verify(() => dataSource.createUser(createdAt: createdAt, fullname: fullname, avatar: avatar)).called(1);
        verifyNoMoreInteractions(dataSource);
      }
    );
  });
  
  group('getUsers', () {
    test(
      'should call the [RemoteDataSource.getUsers] and complete'
      'successfully when the call to the remote source is successful',
      () async {
        // Arrange
        // STUB
        when(
            () => dataSource.getUsers()
        ).thenAnswer((_) async => []);

        // Act
        final result = await repoImpl.getUsers();

        // Assert
        expect(result, isA<Right<dynamic, List<User>>>());
        verify(() => dataSource.getUsers()).called(1);
        verifyNoMoreInteractions(dataSource);
      }
    );

    test(
      'should return a [ApiFailure] when the call to the remote'
      'source is unsuccessful',
      () async {
        // Arrange
        when(
          () => dataSource.getUsers()
        ).thenThrow(tException);
        // Act
        final result = await repoImpl.getUsers();

        // Assert
        expect(result, equals(const Left(ApiFailure(message: "Internal server error", statusCode: 500))));
        verify(() => dataSource.getUsers()).called(1);
        verifyNoMoreInteractions(dataSource);
      }
    );
  });
}