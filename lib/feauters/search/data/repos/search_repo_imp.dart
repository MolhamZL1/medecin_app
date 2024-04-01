import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/search/data/repos/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final ApiService apiService;

  SearchRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<MedicineModel>>> search(
      {required String searchingInput}) async {
    try {
      var data = await apiService.get(endPoint: "search");
      List<MedicineModel> medecines = [];
      for (var medecine in data) {
        medecines.add(MedicineModel.fromJson(medecine));
      }
      return right(medecines);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
