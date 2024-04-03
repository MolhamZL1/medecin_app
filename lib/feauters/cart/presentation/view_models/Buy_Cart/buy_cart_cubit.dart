import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/feauters/cart/data/repos/cart_repo,.dart';

part 'buy_cart_state.dart';

class BuyCartCubit extends Cubit<BuyCartState> {
  BuyCartCubit(this.cartRepo) : super(BuyCartInitial());
  final CartRepo cartRepo;
  Future<void> buyCart() async {
    var result = await cartRepo.buyCart();
    result.fold(
        (failure) => emit(BuyCartFailure(errMessage: failure.errMessage)),
        (success) => emit(BuyCartSuccess()));
  }
}
