import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/core/models/medicine_model.dart';
import 'package:rosemary/feauters/cart/data/repos/cart_repo,.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;
  Future<void> fetchCart() async {
    emit(CartLoading());
    var result = await cartRepo.fetchCart();
    result.fold(
      (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      (medecines) => emit(CartSuccess(medecines: medecines)),
    );
  }

  Future<void> removeFromCart({required String id}) async {
    var result = await cartRepo.removeFromCart(id: id);
    result.fold(
      (failure) => emit(CartFailure(errMessage: failure.errMessage)),
      (message) => fetchCart(),
    );
  }
}
