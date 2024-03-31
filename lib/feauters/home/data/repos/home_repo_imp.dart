import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/home/data/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final ApiService apiservice;

  HomeRepoImp(this.apiservice);
  @override
  Future<Either<ServerFailure, List<dynamic>>> getCategories() async {
    try {
      List<dynamic> data = await apiservice.get(endPoint: "categories");
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
