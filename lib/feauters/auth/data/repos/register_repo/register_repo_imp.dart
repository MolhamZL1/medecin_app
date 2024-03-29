import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/auth/data/repos/register_repo/register_repo.dart';

class RegisterRepoImp implements RegisterRepo {
  final ApiService apiService;
  RegisterRepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, String>> fetchRegister(
      {required String userName,
      required String phoneNumber,
      required String password}) async {
    try {
      Map<String, dynamic> data = await apiService.post(
        endPoint: "register",
        body: {
          "username": userName,
          "phone": phoneNumber,
          "password": password,
        },
      );
      return right(data["token"]);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
