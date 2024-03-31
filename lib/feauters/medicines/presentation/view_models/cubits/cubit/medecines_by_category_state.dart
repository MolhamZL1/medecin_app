part of 'medecines_by_category_cubit.dart';

sealed class MedecinesByCategoryState extends Equatable {
  const MedecinesByCategoryState();

  @override
  List<Object> get props => [];
}

final class MedecinesByCategoryInitial extends MedecinesByCategoryState {}

final class MedecinesByCategoryLoading extends MedecinesByCategoryState {}

final class MedecinesByCategorySuccess extends MedecinesByCategoryState {
  final List<MedicineModel> medecines;

  const MedecinesByCategorySuccess({required this.medecines});
}

final class MedecinesByCategoryFailure extends MedecinesByCategoryState {
  final String errMessage;

  const MedecinesByCategoryFailure({required this.errMessage});
}
