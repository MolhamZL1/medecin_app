import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rosemary/feauters/orders/data/models/OrderModel.dart';
import 'package:rosemary/feauters/orders/data/repo/orders_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo ordersRepo;
  OrdersCubit(this.ordersRepo) : super(OrdersInitial());
  Future<void> fetchOrders() async {
    emit(OrdersLoading());
    var result = await ordersRepo.getOrders();
    result.fold(
        (failure) => emit(OrdersFailure(errMessage: failure.errMessage)),
        (orders) => emit(OrdersSuccess(orders: orders)));
  }
}
