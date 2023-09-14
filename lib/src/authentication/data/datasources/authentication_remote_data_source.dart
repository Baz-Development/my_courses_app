import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_courses_app/src/authentication/data/datasources/authentication_data_source.dart';
import 'package:my_courses_app/src/authentication/data/models/user_model.dart';
import 'package:my_courses_app/core/errors/exception.dart';
import 'package:my_courses_app/core/utils/constants.dart';
import 'package:my_courses_app/core/utils/typedef.dart';

abstract class AuthenticationRemoteDataSource extends AuthenticationDataSource {}

class AuthenticationRemoteDataSourceImplementation implements AuthenticationRemoteDataSource {
  const AuthenticationRemoteDataSourceImplementation(this._client);

  final http.Client _client;

  @override
  Future<void> createUser({
    required String createdAt,
    required String fullname,
    required String avatar
  }) async {
    try {
      final response = await _client.post(
          Uri.parse('$kBaseUrl/users'),
          body: jsonEncode({
            'createdAt': createdAt,
            'fullname': fullname,
            'avatar': avatar
          }));
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ApiException(
          message: response.body,
          statusCode: response.statusCode
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(),
        statusCode: 505
      );
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(
        Uri.parse('$kBaseUrl/users'),
      );
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ApiException(
          message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((userData) => UserModel.fromMap(userData))
          .toList();
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(
        message: e.toString(), statusCode: 505);
    }
  }

}