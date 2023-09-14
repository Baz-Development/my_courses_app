
// Create a mock of AuthenticationRepository
import 'package:mocktail/mocktail.dart';
import 'package:my_courses_app/src/authentication/domain/repositories/authentication_repository.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}