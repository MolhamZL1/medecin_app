import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/models/medicine_model.dart';

abstract class CartRepo {
  Future<Either<Failure, List<MedicineModel>>> fetchCart();
  Future<Either<Failure, Map<String, dynamic>>> buyCart();
  Future<Either<Failure, Map<String, dynamic>>> removeFromCart(
      {required String id});
}
