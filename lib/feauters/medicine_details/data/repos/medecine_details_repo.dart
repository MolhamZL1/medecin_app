import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';

abstract class MedicineDetailsRepo {
  Future<Either<Failure, Map<String, dynamic>>> addToCart(
      {required String medecineID, required int quantity});
}
