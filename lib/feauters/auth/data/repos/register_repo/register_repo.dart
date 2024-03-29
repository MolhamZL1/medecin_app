import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';

abstract class RegisterRepo {
  Future<Either<ServerFailure, String>> fetchRegister(
      {required String userName,
      required String phoneNumber,
      required String password});
}
