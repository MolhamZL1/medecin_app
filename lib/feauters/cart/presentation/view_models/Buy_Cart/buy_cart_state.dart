part of 'buy_cart_cubit.dart';

sealed class BuyCartState extends Equatable {
  const BuyCartState();

  @override
  List<Object> get props => [];
}

final class BuyCartInitial extends BuyCartState {}

final class BuyCartSuccess extends BuyCartState {}

final class BuyCartLoading extends BuyCartState {}

final class BuyCartFailure extends BuyCartState {
  final String errMessage;

  const BuyCartFailure({required this.errMessage});
}
