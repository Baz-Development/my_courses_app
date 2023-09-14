import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_courses_app/src/authentication/data/models/user_model.dart';
import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/src/core/utils/typedef.dart';

import '../../../../fixtures/fixture_reader.dart';


void main() {
  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {
    // Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with Right data', () {
      // Act
      final result = UserModel.fromMap(tMap);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with Right data', () {
      // Act
      final result = UserModel.fromJson(tJson);

      // Assert
      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a [Map] with Right data', () {
      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a [JSON] with Right data', () {
      // Act
      final result = tModel.toJson();

      // Assert
      expect(result, equals(tJson));
    });
  });

  group('copyWith', () {
    test('should return a [UserModel] with different data', () {
      // Act
      final result = tModel.copyWith(fullname: 'Dimitri');
      
      // Assert
      expect(result.fullname, 'Dimitri');
      expect(result.avatar, '_empty.avatar');
      expect(result.createdAt, '_empty.createdAt');
      expect(result.id, '1');
    });
  });
}