import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/feauters/medicine_details/data/repos/medecine_details_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._medicineDetailsRepo) : super(AddToCartInitial());
  final MedicineDetailsRepo _medicineDetailsRepo;
  int quantity = 0;

  Future<void> addToCart({required String medecineID}) async {
    emit(AddToCartLoading());
    var result = await _medicineDetailsRepo.addToCart(
      medecineID: medecineID,
      quantity: quantity,
    );
    return result.fold(
        (failure) => emit(AddToCartFailure(errMessage: failure.errMessage)),
        (success) {
      quantity = 0;
      emit(AddToCartSuccess());
    });
  }
}
