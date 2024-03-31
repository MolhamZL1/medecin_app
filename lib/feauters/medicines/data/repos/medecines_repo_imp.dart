import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/feauters/medicines/data/repos/medecines_repo.dart';

class MedecinesRepoImp implements MedecinesRepo {
  final ApiService apiService;

  MedecinesRepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, List<MedicineModel>>> fetchMedecinesByCategory(
      {required String category}) async {
    try {
      List<dynamic> data =
          await apiService.get(endPoint: "medicines/$category");
      List<MedicineModel> medecines = [];
      for (var medecine in data) {
        try {
          medecines.add(MedicineModel.fromJson(medecine));
        } catch (e) {
          medecines.add(MedicineModel.fromJson(medecine));
        }
      }

      return right(medecines);
    } catch (e) {
      print("true");
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
