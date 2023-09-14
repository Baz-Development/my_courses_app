import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/src/authentication/domain/usecases/create_user.dart';
import 'package:my_courses_app/src/authentication/domain/usecases/get_users.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit({
    required CreateUser createUser,
    required GetUsers getUsers
  }) : _createUser = createUser,
       _getUsers = getUsers,
       super(const AuthenticationInitial());

  final CreateUser _createUser;
  final GetUsers _getUsers;

  Future<void> createUser({
    required String createdAt,
    required String fullname,
    required String avatar
  }) async {
    emit(const CreatingUser());

    final result = await _createUser(
        CreateUserParams(
            createdAt: createdAt,
            fullname: fullname,
            avatar: avatar
        )
    );

    // If is left what you do? and right?
    result.fold(
            (left) => emit(AuthenticationError(left.errorMessage)),
            (right) => emit(const UserCreated())
    );
  }

  Future<void> getUsers() async {
    emit(const GettingUser());

    final result = await _getUsers();

    result.fold(
            (left) => emit(AuthenticationError(left.errorMessage)),
            (right) => emit(UsersLoaded(right))
    );
  }
}
