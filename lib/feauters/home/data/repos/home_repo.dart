import 'package:dartz/dartz.dart';
import 'package:rosemary/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<String>>> getCategories();
}
