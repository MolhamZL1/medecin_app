import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/core/utils/user_info.dart';
import 'package:rosemary/feauters/cart/data/repos/cart_repo,.dart';

class CartRepoImp implements CartRepo {
  final ApiService apiService;

  CartRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<MedicineModel>>> fetchCart() async {
    try {
      var data = await apiService.get(endPoint: "cart/${UserInfo.token}");
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> buyCart() async {
    try {
      var data = await apiService.post(
          endPoint: "addorder",
          body: {"token": UserInfo.token, "username": UserInfo.username});
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> removeFromCart(
      {required String id}) async {
    try {
      var data = await apiService.post(
          endPoint: "removeFromCart",
          body: {"token": UserInfo.token, "id": id});
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
