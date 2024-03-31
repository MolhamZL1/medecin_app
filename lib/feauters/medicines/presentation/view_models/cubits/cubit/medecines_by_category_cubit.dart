import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/medicines/data/repos/medecines_repo.dart';

part 'medecines_by_category_state.dart';

class MedecinesByCategoryCubit extends Cubit<MedecinesByCategoryState> {
  MedecinesByCategoryCubit(this.medecinesRepo)
      : super(MedecinesByCategoryInitial());
  final MedecinesRepo medecinesRepo;
  Future<void> medecines({required String category}) async {
    emit(MedecinesByCategoryLoading());
    var result =
        await medecinesRepo.fetchMedecinesByCategory(category: category);
    return result.fold(
        (failure) =>
            emit(MedecinesByCategoryFailure(errMessage: failure.errMessage)),
        (medecines) => emit(MedecinesByCategorySuccess(medecines: medecines)));
  }
}
