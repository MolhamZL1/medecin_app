import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderModel>>> getOrders();
}
