import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> search({required String searchingInput}) async {
    emit(SearchLoading());
    var result = await searchRepo.search(searchingInput: searchingInput);
    result.fold((failure) => emit(SearchFailure(errMessage: failure.errMessage)), (medecines) => emit(SearchSuccess(medicines: medecines)))
  }
}
