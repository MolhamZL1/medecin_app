import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/models/medicine_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MedicineModel>>> search(
      {required String searchingInput});
}
