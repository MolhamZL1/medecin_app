import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/auth/data/repos/login_repo/login_repo.dart';

class LoginRepoImp implements LoginRepo {
  final ApiService apiService;

  LoginRepoImp(this.apiService);

  @override
  Future<Either<ServerFailure, String>> fetchLogin(
      {required String phoneNumber, required String password}) async {
    try {
      Map<String, dynamic> data = await apiService.post(
        endPoint: "login",
        body: {
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
