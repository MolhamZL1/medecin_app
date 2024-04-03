part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartSuccess extends CartState {
  final List<MedicineModel> medecines;

  const CartSuccess({required this.medecines});
}

final class CartFailure extends CartState {
  final String errMessage;

  const CartFailure({required this.errMessage});
}

final class CartLoading extends CartState {}
