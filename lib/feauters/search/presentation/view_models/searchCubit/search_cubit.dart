import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepo _searchRepo;
  String popUpValue = "Medecine";

  Future<void> searchByMedecine({required String searchingInput}) async {
    emit(SearchLoading());
    var result =
        await _searchRepo.searchByMedecine(searchingInput: searchingInput);
    result.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
        (medecines) => emit(SearchMedecinesSuccess(medicines: medecines)));
  }

  Future<void> searchByCategory({required String searchingInput}) async {
    emit(SearchLoading());
    var result =
        await _searchRepo.searchByCategory(searchingInput: searchingInput);
    result.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
        (categories) => emit(SearchCategoriesSuccess(categories: categories)));
  }
}
