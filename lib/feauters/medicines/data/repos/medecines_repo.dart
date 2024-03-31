import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';
import 'package:rosemary/core/models/medicine_model.dart';

abstract class MedecinesRepo {
  Future<Either<Failure, List<MedicineModel>>> fetchMedecinesByCategory(
      {required String category});
}
