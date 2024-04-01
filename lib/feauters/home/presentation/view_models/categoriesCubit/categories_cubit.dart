import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/feauters/home/data/repos/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  final HomeRepo homeRepo;
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.getCategories();
    result.fold(
        (failure) => emit(CategoriesFailure(errMessage: failure.errMessage)),
        (categories) => emit(CategoriesSuccess(categories: categories)));
  }
}
