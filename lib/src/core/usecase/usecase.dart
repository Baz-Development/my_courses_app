import 'package:my_courses_app/src/core/utils/typedef.dart';

abstract class UsecaseWthParams<Type, Params> {
  const UsecaseWthParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}