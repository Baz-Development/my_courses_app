import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_courses_app/src/authentication/domain/entities/user.dart';
import 'package:my_courses_app/src/authentication/domain/usecases/create_user.dart';
import 'package:my_courses_app/src/authentication/domain/usecases/get_users.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required CreateUser createUser,
    required GetUsers getUsers
  }) : _createUser = createUser,
       _getUsers = getUsers,
       super(AuthenticationInitial()) {
    on<CreateUserEvent>(_createUserHandler);
    on<GetUsersEvent>(_getUsersHandler);
  }

  final CreateUser _createUser;
  final GetUsers _getUsers;

  Future<void> _createUserHandler(
    CreateUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const CreatingUser());

    final result = await _createUser(
      CreateUserParams(
        createdAt: event.createdAt,
        fullname: event.fullname,
        avatar: event.avatar
      )
    );

    // If is left what you do? and right?
    result.fold(
      (left) => emit(AuthenticationError(left.errorMessage)),
      (right) => emit(const UserCreated())
    );
  }

  Future<void> _getUsersHandler(
    GetUsersEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const GettingUser());

    final result = await _getUsers();

    result.fold(
      (left) => emit(AuthenticationError(left.errorMessage)),
      (right) => emit(UsersLoaded(right))
    );
  }
}
