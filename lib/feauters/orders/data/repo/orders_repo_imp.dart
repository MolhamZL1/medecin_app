import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/utils/api_service.dart';
import 'package:rosemary/core/utils/user_info.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';
import 'package:rosemary/feauters/orders/data/repo/orders_repo.dart';

class OrdersRepoImp implements OrdersRepo {
  final ApiService apiService;

  OrdersRepoImp(this.apiService);
  @override
  Future<Either<Failure, List<OrderModel>>> getOrders() async {
    try {
      var data = await apiService.get(endPoint: "orders/${UserInfo.token}");
      List<OrderModel> orders = [];
      for (var order in data) {
        try {
          orders.add(OrderModel.fromJson(order));
        } catch (e) {
          orders.add(OrderModel.fromJson(order));
        }
      }
      return right(orders);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
