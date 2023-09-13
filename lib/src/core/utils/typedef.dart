import 'package:dartz/dartz.dart';
import 'package:my_courses_app/src/core/errors/failure.dart';

// Define a new type with failure or T(Generic type)
typedef ResultFuture<T> = Future<Either<Failure, T>>;