import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rosemary/core/functions/customSnackBar.dart';
import 'package:rosemary/core/widgets/custom_circle_loading.dart';
import 'package:rosemary/feauters/orders/presentation/view_models/ordersCubit/orders_cubit.dart';
import 'package:rosemary/feauters/orders/presentation/views/widgets/Custom_order_item.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersFailure) {
          customshowSnackBar(context,
              massege: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        if (state is OrdersSuccess) {
          return state.orders.isEmpty
              ? Image.asset("")
              : ListView.builder(
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return CustomOrderItem(
                      order: state.orders[index],
                    );
                  });
        } else if (state is OrdersLoading) {
          return const CustomCircleLoading();
        } else {
          return const Text("");
        }
      },
    );
  }
}
