import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/home/data/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiservice;

  HomeRepoImp({required this.apiservice});
  @override
  Future<Either<ServerFailure, List<String>>> getCategories() async {
    try {
      List<String> data = await apiservice.get(endPoint: "categouries");
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
