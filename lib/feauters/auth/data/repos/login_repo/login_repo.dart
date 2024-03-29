import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';

abstract class LoginRepo {
  Future<Either<ServerFailure, String>> fetchLogin(
      {required String phoneNumber, required String password});
}
