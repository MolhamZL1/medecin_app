import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/core/utils/user_info.dart';
import 'package:rosemary/feauters/medicine_details/data/repos/medecine_details_repo.dart';

class MedicineDetailsRepoImp implements MedicineDetailsRepo {
  final ApiService apiService;

  MedicineDetailsRepoImp(this.apiService);
  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> addToCart(
      {required String medecineID, required int quantity}) async {
    try {
      Map<String, dynamic> data = await apiService.post(
          endPoint: "addToCart",
          body: {
            "id": medecineID,
            "quantity": quantity,
            "token": UserInfo.token
          });
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
