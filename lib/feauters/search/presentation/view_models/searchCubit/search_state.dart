part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchMedecinesSuccess extends SearchState {
  final List<MedicineModel> medicines;

  const SearchMedecinesSuccess({required this.medicines});
}

final class SearchCategoriesSuccess extends SearchState {
  final List<dynamic> categories;

  const SearchCategoriesSuccess({required this.categories});
}

final class SearchFailure extends SearchState {
  final String errMessage;

  const SearchFailure({required this.errMessage});
}
