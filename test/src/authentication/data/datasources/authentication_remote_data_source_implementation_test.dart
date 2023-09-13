import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:my_courses_app/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:my_courses_app/src/authentication/data/models/user_model.dart';
import 'package:my_courses_app/src/core/errors/exception.dart';
import 'package:my_courses_app/src/core/utils/constants.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late http.Client client;
  late AuthenticationRemoteDataSource dataSource;

  setUp(() {
    client = MockClient();
    dataSource = AuthenticationRemoteDataSourceImplementation(client);
    registerFallbackValue(Uri());
  });

  group('createUser', () {
    test('should complete successfully when the status code is 200...299', () async {
      // Arrange
      when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
        (_) async => http.Response("User created successfully", 201)
      );

      // Act
      final methodCall = dataSource.createUser;

      // Assert
      expect(
        methodCall(
          createdAt: 'createdAt',
          fullname: 'fullname',
          avatar: 'avatar'
        ),
        completes
      );

      verify(
        () => client.post(
          Uri.parse("$kBaseUrl/users"),
          body: jsonEncode({
            'createdAt': 'createdAt',
            'fullname': 'fullname',
            'avatar': 'avatar'
          })
        )
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw [ApiException] when the status code is not 200...299', () async {
      // Arrange
      when(() => client.post(any(), body: any(named: 'body'))).thenAnswer(
              (_) async => http.Response("Bad Request", 400)
      );

      // Act
      final methodCall = dataSource.createUser;

      // Assert
      expect(
          () async => methodCall(
              createdAt: 'createdAt',
              fullname: 'fullname',
              avatar: 'avatar'
          ),
          throwsA(const ApiException(message: "Bad Request", statusCode: 400))
      );

      verify(
        () => client.post(
          Uri.parse("$kBaseUrl/users"),
          body: jsonEncode({
            'createdAt': 'createdAt',
            'fullname': 'fullname',
            'avatar': 'avatar'
          })
        )
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('getUser', () {
    final tUsers = [const UserModel.empty()];
    test('should complete successfully when the status code is 200...299', () async {
      // Arrange
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response(jsonEncode([tUsers.first.toMap()]), 200)
      );

      // Act
      final result = await dataSource.getUsers();

      // Assert
      expect(
        result,
        equals(tUsers)
      );

      verify(
        () => client.get(
          Uri.parse("$kBaseUrl/users"),
        )
      ).called(1);
      verifyNoMoreInteractions(client);
    });

    test('should throw [ApiException] when the status code is not 200...299', () async {
      // Arrange
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response("Bad Request", 400)
      );

      // Act
      final methodCall = dataSource.getUsers();

      // Assert
      expect(
        () async => methodCall,
        throwsA(const ApiException(message: "Bad Request", statusCode: 400))
      );

      verify(
        () => client.get(
          Uri.parse("$kBaseUrl/users")
        )
      ).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}